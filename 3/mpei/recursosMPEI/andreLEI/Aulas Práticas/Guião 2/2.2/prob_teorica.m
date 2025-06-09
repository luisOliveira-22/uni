function p = prob_teorica(k,n,p)

p= nchoosek(n,k)*p^k*(1-p)^(n-k); 

end