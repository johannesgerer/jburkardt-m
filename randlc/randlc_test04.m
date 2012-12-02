function randlc_test04 ( )

%*****************************************************************************80
%
%% RANDLC_TEST04 tests RANDLC_JUMP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 March 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RANDLC_TEST04\n' );
  fprintf ( 1, '  RANDLC_JUMP jumps directly to the K-th value\n' );
  fprintf ( 1, '  returned by RANDLC.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         K X(hard way)     X(jump)\n' );
  fprintf ( 1, '\n' );

  k = 1;

  for klog = 1 : 10

    seed = 123456789;
    for i = 1 : k
      [ x1, seed ] = randlc ( seed );
    end

    seed = 123456789;
    [ x2, seed ] = randlc_jump ( seed, k );

    fprintf ( 1, '  %8d  %f10  %f10\n', k, x1, x2 );

    k = k * 2;

  end

  return
end
