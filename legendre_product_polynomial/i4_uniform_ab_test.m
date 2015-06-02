function i4_uniform_ab_test ( )

%*****************************************************************************80
%
%% I4_UNIFORM_AB_TEST tests I4_UNIFORM_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 October 2014
%
%  Author:
%
%    John Burkardt
%
  a = -100;
  b = 200;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_UNIFORM_AB_TEST\n' );
  fprintf ( 1, '  I4_UNIFORM_AB computes pseudorandom values\n' );
  fprintf ( 1, '  in an interval [A,B].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower endpoint A = %f\n', a );
  fprintf ( 1, '  The upper endpoint B = %f\n', b );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 20

    [ j, seed ] = i4_uniform_ab ( a, b, seed );

    fprintf ( 1,'  %8d  %8d\n', i, j );

  end

  return
end
