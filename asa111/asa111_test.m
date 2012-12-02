function asa111_test ( )

%*****************************************************************************80
%
%% ASA111_TEST tests ASA111.
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
  fprintf ( 1, 'ASA111_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test the routines in ASA111.\n' );

  asa111_test01 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA111_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
