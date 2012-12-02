function asa245_test ( )

%*****************************************************************************80
%
%% ASA245_TEST tests ASA245.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA245_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test the ASA245 routines.\n' );

  asa245_test01 ( );
  asa245_test02 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA245_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end


