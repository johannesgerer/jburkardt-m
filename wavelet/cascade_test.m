function cascade_test ( )

%*****************************************************************************80
%
%% CASCADE_TEST tests CASCADE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 August 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CASCADE_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the CASCADE library.\n' );

  cascade_test01 ( );
  cascade_test02 ( );
  cascade_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CASCADE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



