#encoding: utf8

# YOUR NAME: Luís Oliveira
# YOUR NUMBER: 98543

# COLLEAGUES WITH WHOM YOU DISCUSSED THIS ASSIGNMENT (names, numbers):
# - ...
# - ...

from semantic_network import *
from constraintsearch import *
from bayes_net import *

from itertools import product
from functools import reduce

class MySN(SemanticNetwork):

    def __init__(self):
        SemanticNetwork.__init__(self)
        # ADD CODE HERE IF NEEDED
        pass

    # General query method, processing different types of
    # relations according to their specificities
    def query(self,entity,relname):
        inherited_relations = self.inherited_relations(entity, relname)
        direct_relations = self.query_local(e1=entity, relname=relname)

        all_relations = list(set(direct_relations + inherited_relations))

        if not all_relations: return []
        if relname in ['member', 'subtype']: return [rel.relation.entity2 for rel in direct_relations]

        # MOST TYPES
        count = {"AssocOne": 0,
                 "AssocNum": 0,
                 "AssocSome": 0}
        
        for rel in all_relations:
            if isinstance(rel.relation, AssocOne):
                count["AssocOne"] += 1
            elif isinstance(rel.relation, AssocNum):
                count["AssocNum"] += 1
            elif isinstance(rel.relation, AssocSome):
                count["AssocSome"] += 1

        type = max(count, key=count.get)

        return self.process_relations(all_relations, type)

        
    ### AUX METHODS ###

    # COLLECT INHERITED RELATIONS
    def inherited_relations(self, entity, relname):
        inherited = []
        queue = [entity]
        visited = set()

        while queue:
            current_entity = queue.pop()

            if current_entity in visited: continue

            visited.add(current_entity)
            local_relations = self.query_local(e1=current_entity, relname=relname)

            if relname in ['AssocOne', 'AssocNum']:
                # STOP INHERITANCE IF FINDS A CANCELLING RELATION TYPE
                if any(isinstance(rel.relation, (AssocOne, AssocNum)) for rel in local_relations):
                    inherited.extend(local_relations)
                    break
            else:
                inherited.extend(local_relations)

            # ENQUEUE PARENT ENTITIES FOR FURTHER TRAVERSAL
            parent_relations = self.query_local(e1=current_entity, relname="subtype")
            parent_relations += self.query_local(e1=current_entity, relname="member")
            queue.extend(rel.relation.entity2 for rel in parent_relations)

        return inherited


    def process_relations(self, relations, type):
        filtered = [rel.relation.entity2 for rel in relations 
                    if rel.relation.__class__.__name__ == type]
        
        if not filtered:
            return []
            
        if type == "AssocNum":
            return [sum(filtered) / len(filtered)]
        elif type == "AssocSome":
            return list(set(filtered))
        elif type == "AssocOne":
            return [max(set(filtered), key=filtered.count)]
        
        return []






class MyBN(BayesNet):

    def __init__(self):
        BayesNet.__init__(self)
        self.parent_dict: dict[str, list[str]] = {}


    def test_independence(self, v1: str, v2: str, given: list[str]) -> tuple[bool, list[tuple[str, str]]]:
        graph = self.graph(v1, v2, given)
        independent = not self.connected(graph, v1, v2)
        return independent, graph
    

    ### AUX METHODS ###

    def graph(self, v1: str, v2: str, given: list[str]) -> list[tuple[str, str]]:
        ancestors = set()
        graph = set()
        stack = [v1, v2] + given
        
        while stack:
            var = stack.pop()
            if var not in ancestors:
                ancestors.add(var)
                for mtrue, mfalse, _ in self.dependencies.get(var, []):
                    parents = mtrue + mfalse
                    stack.extend(parents)
                    graph.update((parent, var) for parent in parents)
                    for group in [mtrue, mfalse]:
                        graph.update((min(group[i], group[j]), max(group[i], group[j]))
                                for i in range(len(group)) 
                                for j in range(i + 1, len(group)))
        
        return [edge for edge in graph if not any(var in edge for var in given)]
    

    # ADDING VAR TO BAYES NET & UPDATE PARENT RELATIONS
    def add(self, var: str, mtrue: list[str], mfalse: list[str], p: float) -> None:
        super().add(var, mtrue, mfalse, p)
        for parent in mtrue + mfalse:
            self.parent_dict.setdefault(var, []).append(parent)


    def connected(self, graph: list[tuple[str, str]], start: str, end: str, visited: set[str] = None) -> bool:
        stack = [start]
        visited = set()
        
        while stack:
            current = stack.pop()
            if current == end:
                return True
            if current not in visited:
                visited.add(current)
                neighbors = [(v1, v2) for v1, v2 in graph if current in (v1, v2)]
                for edge in neighbors:
                    next_node = edge[1] if edge[0] == current else edge[0]
                    if next_node not in visited:
                        stack.append(next_node)
        return False





class MyCS(ConstraintSearch):

    def __init__(self,domains,constraints):
        ConstraintSearch.__init__(self,domains,constraints)


    def search_all(self,domains=None):
        space = domains or self.domains
    
        if all(len(space[item]) == 1 for item in space):
            return [{item: space[item][0] for item in space}]
        if any(not space[item] for item in space):
            return []
        
        aux = min((x for x in space if len(space[x]) > 1), 
                    key=lambda x: len(space[x]))
        
        results = []
        for val in space[aux]:
            next_space = {**space, aux: [val]}
            self.propagate(next_space, aux)
            results.extend(x for x in self.search_all(next_space) if x not in results)
        
        return results





def handle_ho_constraint(domains,constraints,variables,constraint):
    key = reduce(lambda x, y: x + y, variables)

    domains[key] = [tuple(values) 
                   for values in product(*(domains[var] for var in variables)) 
                   if constraint(values)]
    
    for pos, var in enumerate(variables):
        constraints[(key, var)] = lambda *args, i=pos: args[1][i] == args[3]
        constraints[(var, key)] = lambda *args, i=pos: args[3][i] == args[1]