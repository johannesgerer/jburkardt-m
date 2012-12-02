function lattice_rule_test13 ( )

%*****************************************************************************80
%
%% LATTICE_RULE_TEST13 tests FIND_Z20.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ian Sloan, Stephen Joe,
%    Lattice Methods for Multiple Integration,
%    Oxford, 1994, page 18.
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATTICE_RULE_TEST13\n' );
  fprintf ( 1, '  FIND_Z20 finds the optimal lattice generator Z\n' );
  fprintf ( 1, '  with Fourier coefficient smoothness ALPHA = 2,\n' );
  fprintf ( 1, '  and copy exponent 0,\n' );
  fprintf ( 1, '  for a rank 1 "method of good lattice points" rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     M        Z(1)      Z(2)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (M = Fibonacci)\n' );
  fprintf ( 1, '\n' );

  for i = 3 : 10

    m = fibonacci(i);

    z = find_z20 ( dim_num, m );

    fprintf ( 1, '  %4d  ', m );
    for dim = 1 : dim_num
      fprintf ( 1, '  %8d', z(dim) );
    end
    fprintf ( 1, '\n' );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  (M = 2**K)\n' );
  fprintf ( 1, '\n' );

  for i = 2 : 10

    m = 2^i;

    z = find_z20 ( dim_num, m );

    fprintf ( 1, '  %4d  ', m );
    for dim = 1 : dim_num
      fprintf ( 1, '  %8d', z(dim) );
    end
    fprintf ( 1, '\n' );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  (M = 3*2**K)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    m = 3 * 2^i;

    z = find_z20 ( dim_num, m );

    fprintf ( 1, '  %4d  ', m );
    for dim = 1 : dim_num
      fprintf ( 1, '  %8d', z(dim) );
    end
    fprintf ( 1, '\n' );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  (M = Prime)\n' );
  fprintf ( 1, '\n' );

  for i = 3 : 10

    m = prime ( 10 * i );

    z = find_z20 ( dim_num, m );

    fprintf ( 1, '  %4d  ', m );
    for dim = 1 : dim_num
      fprintf ( 1, '  %8d', z(dim) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
