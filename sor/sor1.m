function x_new = sor1 ( n, a, b, x, w )

%*****************************************************************************80
%
%% SOR1 carries out one step of the SOR iteration.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2011
%
%  Author:
%
%    John Burkardt
%
  x_new = zeros ( n, 1 );

  for i = 1 : n

    x_new(i) = b(i);
    x_new(i) = x_new(i) - a(i,1:i-1) * x_new(1:i-1);
    x_new(i) = x_new(i) - a(i,i+1:n) * x(i+1:n);
    x_new(i) = x_new(i) / a(i,i);

    x_new(i) = ( 1.0 - w ) * x(i) + w * x_new(i);

  end

  return
end

