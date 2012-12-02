function asa063_test ( )

%*****************************************************************************80
%
%% ASA063_TEST tests ASA063.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA063_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test the ASA063 routines.\n' );

  asa063_test01 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA063_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end


