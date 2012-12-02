function f = fdemo(A)
%FDEMO   Demonstration function for direct search maximizers.
%        FDEMO(A) is the reciprocal of the underestimation ratio for RCOND
%        applied to the square matrix A.
%        Demonstration function for ADSMAX, MDSMAX and NMSMAX.

f = norm(A,1)*norm(inv(A),1)*rcond(A);  % f >= 1
