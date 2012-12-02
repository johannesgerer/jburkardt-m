function uniform_test13 ( )

%*****************************************************************************80
%
%% TEST13 tests R4_UNIFORM_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 July 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST13\n' );
  fprintf ( 1, '  R4_UNIFORM_AB computes pseudorandom real values\n' );
  fprintf ( 1, '  in the interval [RLO,RHI].\n' );

  rlo = 5.0;
  rhi = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower endpoint RLO = %f\n', rlo );
  fprintf ( 1, '  The upper endpoint RHI = %f\n', rhi );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r, seed ] = r4_uniform_ab ( rlo, rhi, seed );
    fprintf ( 1, '  %6d  %f\n', i, r );
  end

  return
end
