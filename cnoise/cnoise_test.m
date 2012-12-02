function cnoise_test ( )

%*****************************************************************************80
%
%% CNOISE_TEST tests the CNOISE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 April 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CNOISE_TEST:\n' );
  fprintf ( 1, '  Test the CNOISE library.\n' );

  m = 10000;
  n = 10000;
  var = 1.0;
  alpha = 1.0;
  cnoise_test01 ( m, n, var, alpha );

  m = 10000;
  n = 10000;
  var = 1.0;
  r = 1.0;
  alpha = 1.0;
  cnoise_test02 ( m, n, var, r, alpha );

  m = 10000;
  n = 10000;
  r = 1.0;
  alpha = 1.0;
  cnoise_test03 ( m, n, r, alpha );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CNOISE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
