function sine_transform_test01 ( )

%*****************************************************************************80
%
%% SINE_TRANSFORM_TEST01 demonstrates that the transform is its own inverse.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2012
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SINE_TRANSFORM_TEST01:\n' );
  fprintf ( 1, '  SINE_TRANSFORM_DATA does a sine transform of data\n' );
  fprintf ( 1, '  defined by a vector.\n' );
  fprintf ( 1, '\n' ); 
  fprintf ( 1, '  Demonstrate that the transform is its own inverse.\n' );
  fprintf ( 1, '  Let R be a random N vector.\n' );
  fprintf ( 1, '  Let S be the transform of D.\n' );
  fprintf ( 1, '  Let T be the transform of E.\n' );
  fprintf ( 1, '  Then R and T will be equal.\n' );

% r = rand ( n, 1 );
  seed = 123456789;
  [ r, seed ] = r8vec_uniform_01 ( n, seed );
  s = sine_transform_data ( n, r );
  t = sine_transform_data ( n, s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I      R(I)        S(I)        T(I)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %10f  %10f  %10f\n', i, r(i), s(i), t(i) );
  end

  return
end
