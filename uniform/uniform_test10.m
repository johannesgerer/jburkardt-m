function uniform_test10 ( )

%*****************************************************************************80
%
%% TEST10 tests I4VEC_UNIFORM_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 November 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST10\n' );
  fprintf ( 1, '  I4VEC_UNIFORM_AB computes pseudorandom integer values\n' );
  fprintf ( 1, '  in the interval [A,B].\n' );

  a = 6;
  b = 10;
  n = 10000;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower endpoint A = %d\n', a );
  fprintf ( 1, '  The upper endpoint B = %d\n', b );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  freq(a:b) = 0;

  [ i4vec, seed ] = i4vec_uniform_ab ( n, a, b, seed );

  for i = 1 : n

    j = i4vec(i);

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
