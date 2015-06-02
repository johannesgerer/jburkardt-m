function differ_test03 ( )

%*****************************************************************************80
%
%% DIFFER_TEST03 tests DIFFER_MATRIX.
%
%  Discussion:
%
%    Reproduce a specific example.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 November 2013
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIFFER_TEST03\n' );
  fprintf ( 1, '  Reproduce a specific example.\n' );
%
%  Compute the coefficients for a specific stencil.
%
  stencil(1:n,1) = [ -3.0; -2.0; -1.0; 1.0 ];
  b = zeros ( n, 1 );
  order = 1;
  b(order,1) = 1.0;
  a = differ_matrix ( n, stencil );
  c = a \ b;
  r8vec_print ( n, c, '  Solution of DIFFER system:' );
%
%  Use the coefficients C to estimate the first derivative of EXP(X)
%  at X0, using a spacing of DX = 0.1.
%
  x0 = 1.3;
  dx = 0.1;
  df = 0.0;
  for i = 1 : n
    df = df + c(i,1) * ( exp ( x0 + stencil(i,1) * dx ) - exp ( x0 ) );
  end
  dfdx = df / dx;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DFDX =         %g\n', dfdx );
  fprintf ( 1, '  d exp(x) /dx = %g\n', exp ( x0 ) );

  return
end

