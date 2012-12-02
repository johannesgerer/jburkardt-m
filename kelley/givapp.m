function vrot = givapp ( c, s, vin, k )
 
%  Apply a sequence of k Givens rotations, used within gmres codes
% 
%  C. T. Kelley, July 10, 1994
%
%  function vrot=givapp(c, s, vin, k)
%
%  Disclaimer:
%
%    This code comes with no guarantee or warranty of any kind.
%
%  Author:
%
%    Tim Kelley
%
%  Reference:
%
%    Tim Kelley,
%    Iterative Methods for Linear and Nonlinear Equations,
%    SIAM, 2004,
%    ISBN: 0898713528,
%    LC: QA297.8.K45.
%
  vrot=vin;
  for i=1:k
    w1=c(i)*vrot(i)-s(i)*vrot(i+1);
%    w2=s(i)*vrot(i)+c(i)*vrot(i+1);
    w2=s(i)*vrot(i)+conj(c(i))*vrot(i+1);
    vrot(i:i+1)=[w1,w2];
  end
