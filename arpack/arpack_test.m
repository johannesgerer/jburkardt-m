function arpack_test ( )

%*****************************************************************************80
%
%% ARPACK_TEST tests ARPACK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ARPACK_TEST\n' );
  fprintf ( 1, '  Test the MATLAB ARPACK routines.\n' );

  arpack_test01 ( );
  arpack_test02 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ARPACK_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



