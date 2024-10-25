Jcoef[p][1] = p
if (i < nrealx) Jcoef[p][2] = p+1;
if (i > 1) Jcoef[p][3] = p-1;
if (i < nrealy) Jcoef[p][4] = p+nRealx;
if (i < nrealx) Jcoef[p][5] = p+1;



Acoef[p][1] += half * (-1./dx2 - 1./dy2)
Acoef[p][2] += half * (1./dx2)
Acoef[p][4] += half * (1./dy2)

Acoef[p][1] += half * (-1./dx2 - 1./dy2)
Acoef[p][2] += half * (1./dx2)
Acoef[p][4] += half * (1./dy2)

// add rest of acoef 


// Parrellel aspects 
/* jacobi iteration 

Strip out parrellel  and do a pe sum accross boundaries */