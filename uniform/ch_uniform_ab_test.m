function ch_uniform_ab_test ( )

%*****************************************************************************80
%
%% CH_UNIFORM_AB_TEST tests CH_UNIFORM_AB.
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
  fprintf ( 1, 'CH_UNIFORM_AB_TEST\n' );
  fprintf ( 1, '  CH_UNIFORM_AB computes pseudorandom character values\n' );
  fprintf ( 1, '  in the interval [CLO,CHI].\n' );

  clo = 'A';
  chi = 'J';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower endpoint CLO = %c\n', clo );
  fprintf ( 1, '  The upper endpoint CHI = %c\n', chi );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ ch, seed ] = ch_uniform_ab ( clo, chi, seed );
    fprintf ( 1, '  %6d  %c\n', i, ch );
  end

  return
end
