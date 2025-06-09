function Simil=similaresUsandoLSH(MHr,MH,nfd,limiar, u)
%  Determinar pares de utilizadores utilizando a matriz de Assinaturas obtida pela aplicação de LSH 

Nelem=length(MH);   % núm. de elementos
Simil=[];
candidatos=0;
nSimilares= 0;      % núm.  de semelhantes

h=waitbar(0,'Candidatos ..');

%  para todos dos elementos
for n1= 1:Nelem
    waitbar(n1/Nelem,h);
        
    for n2= n1+1:Nelem
        %  verificar se alguma banda igual 
        if any(MHr(:,n1)==MHr(:,n2))
            %fprintf(1,'Par candidato : %d %d\n', n1,n2);
            candidatos=candidatos+1;
        
            % distância baseada em MinHash
            simJ= sum(MH(:,n1)==MH(:,n2))/nfd;
            distJ=1-simJ;
            
            if distJ<limiar
                fprintf(1,'Par (%d %d) aprovado\n',n1,n2); 
                nSimilares= nSimilares+1;
                Simil(nSimilares,:)= [u(n1) u(n2) distJ];
            end
        end
    end
end
    
fprintf(1,'Testados %d pares candidatos\n', candidatos);