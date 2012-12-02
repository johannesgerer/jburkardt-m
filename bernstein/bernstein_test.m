function bernstein_test ( )

%*****************************************************************************80
%
%% BERNSTEIN_TEST tests BERNSTEIN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 July 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BERNSTEIN_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the BERNSTEIN library.\n' );

  bernstein_test01 ( );
  bernstein_test02 ( );
  bernstein_test03 ( )
  bernstein_test04 ( );
  bernstein_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BERNSTEIN_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



