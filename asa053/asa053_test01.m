function asa053_test01 ( )

%*****************************************************************************80
%
%% TEST01 generates a random Wishart variate.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA053_TEST01\n' );
  fprintf ( 1, '  Generate a single Wishart deviate.\n' );

  d = [ ...
    3.0, ...
    2.0, 4.0, ...
    1.0, 2.0, 5.0 ];
  n = 1;
  np = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of variables is %d\n', np );
  fprintf ( 1, '  The number of degrees of freedom is %d\n', n );

  r8utp_print ( np, d, '  The upper Cholesky factor:' );

  [ sa, seed ] = wshrt ( d, n, np, seed );

  r8pp_print ( np, sa, '  The sample matrix:' );

  return
end

