function bvec_uniform_test ( )

%*****************************************************************************80
%
%% BVEC_UNIFORM_TEST tests BVEC_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 December 2014
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BVEC_UNIFORM_TEST\n' );
  fprintf ( 1, '  BVEC_UNIFORM computes a binary vector\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );

  fprintf ( 1, '\n' );
  for i = 1 : 10
    [ b, seed ] = bvec_uniform ( n, seed );
    bvec_print ( n, b, '' );
  end

  return
end
