function vandermonde_test ( )

%*****************************************************************************80
%
%% VANDERMONDE_TEST tests the VANDERMONDE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VANDERMONDE_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the VANDERMONDE library.\n' );

  bivand1_test ( );
  bivand2_test ( );
  dvand_test ( );
  dvandprg_test ( );
  pvand_test ( );
  pvandprg_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VANDERMONDE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

