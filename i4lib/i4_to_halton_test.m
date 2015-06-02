function i4_to_halton_test ( )

%*****************************************************************************80
%
%% I4_TO_HALTON_TEST tests I4_TO_HALTON. 
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2014
%
%  Author:
%
%    John Burkardt
%
  base = [ 2, 3, 5 ];
  leap = [ 1, 1, 1 ];
  seed = [ 0, 0, 0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_TO_HALTON_TEST\n' );
  fprintf ( 1, '  I4_TO_HALTON computes a Halton sequence.\n' );
  fprintf ( 1, '  The user specifies all data explicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we call I4_TO_HALTON repeatedly.\n' );
  fprintf ( 1, '  We use distinct primes as bases.\n' );

  n = 10;

  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I    R(0)      R(1)      R(2)\n' );
  fprintf ( 1, '\n' );
  for step = 0 : n
    r = i4_to_halton ( dim_num, step, seed, leap, base  );
    fprintf ( 1, '  %2d', step );
    for i = 1 : dim_num
      fprintf ( 1, '  %8f', r(i) );
    end
    fprintf ( 1, '\n' );
  end
  return;
end
