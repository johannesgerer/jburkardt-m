function uniform_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests I4_UNIFORM-AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 November 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  I4_UNIFORM_AB computes pseudorandom integer values\n' );
  fprintf ( 1, '  in the interval [A,B].\n' );

  a = 6;
  b = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower endpoint A = %d\n', a );
  fprintf ( 1, '  The upper endpoint B = %d\n', b );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  freq(a:b) = 0;

  for i = 1 : 10000

    [ j, seed ] = i4_uniform_ab ( a, b, seed );

    if ( j < a )
      fprintf ( 1, '  Illegal value J = %d\n', j );
    elseif ( j <= b )
      freq(j) = freq(j) + 1;
    else
      fprintf ( 1, '  Illegal value J = %d\n', j );
    end

  end

  fprintf ( 1,  '\n' );
  fprintf ( 1,  '        I    Frequency\n' );
  fprintf ( 1,  '\n' );
  for i = a : b
    fprintf ( 1, '  %8d  %8d\n', i, freq(i) );
  end

  return
end
