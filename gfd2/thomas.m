function [x] = thomas ( b, a, c, f ) 

%*****************************************************************************80
%
%% THOMAS carries out the Thomas algorithm for tridiagonal linear systems.
%
%  Discussion:
%
%    This function is discussed in chapter 6 of the reference.
%
%  Modified:
%
%    08 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
%    Input, real B(M), the lower diagonal of the matrix.  B(1) is ignored.
%
%    Input, real A(M), the diagonal entries of the matrix.
%
%    Input, real C(M), the upper diagonal of the matrix.  C(M) is ignored.
%
%    Input, real F(M), the right hand side of the linear system.
%
%    Output, real X(M), the solution of the linear system.
%
  m = length(a);

  for k=2:m 
    b(k)=b(k)/a(k-1);
    a(k)=a(k)-b(k)*c(k-1);
    f(k)=f(k)-b(k)*f(k-1);
  end

  x(m) = f(m) / a(m);
  for k=m-1:-1:1
    x(k)=(f(k)-c(k)*x(k+1))/a(k);
  end

  return
end

