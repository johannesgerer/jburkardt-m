function sphere_lebedev_rule_test ( )

%*****************************************************************************80
%
%% SPHERE_LEBEDEV_RULE_TEST tests the SPHERE_LEBEDEV_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 September 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_LEBEDEV_RULE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPHERE_LEBEDEV_RULE library.\n' );

  sphere_lebedev_rule_test01 ( );
  sphere_lebedev_rule_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_LEBEDEV_RULE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
