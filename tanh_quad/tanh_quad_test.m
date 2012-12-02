function tanh_quad_test ( )

%*****************************************************************************80
%
%% TANH_QUAD_TEST tests TANH_QUAD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 January 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TANH_QUAD_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the TANH_QUAD library.\n' );

  tanh_quad_test01 ( );
  tanh_quad_test012 ( );
  tanh_quad_test02 ( );
  tanh_quad_test025 ( );
  tanh_quad_test03 ( );

  for p = 1 : 14
    tanh_quad_test032 ( p );
  end

  for p = 1 : 14
    tanh_quad_test04 ( p );
  end

  for p = 1 : 14
    tanh_quad_test05 ( p );
  end

  for p = 1 : 14
    tanh_quad_test06 ( p );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TANH_QUAD_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



