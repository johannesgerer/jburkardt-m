function asa066_test ( )

%*****************************************************************************80
%
%% ASA066_TEST tests ASA066.
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
  fprintf ( 1, 'ASA066_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test the routines in ASA066.\n' );

  asa066_test01 ( );
  asa066_test02 ( );
  asa066_test03 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA066_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
