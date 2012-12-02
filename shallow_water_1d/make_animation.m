%
%  Generate the data arrays.
%
  nx = 41;
  nt = 100;
  x_length = 1.0;
  t_length = 0.2;
  g = 9.8;

  [ h_array, uh_array, x, t ] = shallow_water_1d ( 41, 100, 1.0, 0.2, 9.8 )
%
%  Create a sequence of JPG images.
%
  shallow_water_1d_animation ( h_array, uh_array, x, t )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAKE_ANIMATION:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
