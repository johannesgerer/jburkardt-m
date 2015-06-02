function r8_power_test ( )

%*****************************************************************************80
%
%% R8_POWER_TEST tests R8_POWER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_POWER_TEST\n' );
  fprintf ( 1, '  R8_POWER computes R^P.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      R          P       R8_POWER\n' );
  fprintf ( 1, '\n' );

  for i = -5 : 5

    r = 2.0;
    p = i;
    value = r8_power ( r, p );
    fprintf ( 1, '  %14f  %5d  %14f\n', r, p, value );

  end

  return
end
