function r8_uniform_ab_test ( )

%*****************************************************************************80
%
%% R8_UNIFORM_AB_TEST tests R8_UNIFORM_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 June 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_UNIFORM_AB_TEST\n' );
  fprintf ( 1, '  R8_UNIFORM_AB computes pseudorandom double precision values\n' );
  fprintf ( 1, '  in the interval [DLO,DHI].\n' );

  dlo = 5.0;
  dhi = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower endpoint DLO = %f\n', dlo );
  fprintf ( 1, '  The upper endpoint DHI = %f\n', dhi );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ d, seed ] = r8_uniform_ab ( dlo, dhi, seed );
    fprintf ( 1, '  %6d  %f\n', i, d );
  end

  return
end
