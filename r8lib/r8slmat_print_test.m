function r8slmat_print_test ( )

%*****************************************************************************80
%
%% R8SLMAT_PRINT_TEST tests R8SLMAT_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 3;

  a1 = [ ...
    21.0, 31.0, 41.0, 51.0, 61.0, 71.0, ...
          32.0, 42.0, 52.0, 62.0, 72.0, ...
                43.0, 53.0, 63.0, 73.0, ...
                      54.0, 64.0, 74.0, ...
                            65.0, 75.0, ...
                                  76.0 ];
  a2 = [ ...
    21.0, 31.0, 41.0, 51.0, 61.0, 71.0, ...
          32.0, 42.0, 52.0, 62.0, 72.0, ...
                43.0, 53.0, 63.0, 73.0 ];
  a3 = [ ...
    21.0, 31.0, 41.0, ...
          32.0, 42.0, ...
          43.0 ];
  m_test = [ 7, 7, 4 ];
  n_test = [ 7, 3, 7 ];
  size_test = [ 21, 15, 6 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8SLMAT_PRINT_TEST\n' );
  fprintf ( 1, '  R8SLMAT_PRINT prints a strictly lower triangular matrix\n' );
  fprintf ( 1, '  stored compactly.  Only the (possibly) nonzero\n' );
  fprintf ( 1, '  elements are printed.\n' );

  for test = 1 : test_num

    m = m_test(test);
    n = n_test(test);
    size = size_test(test);

    if ( test == 1 )
      a(1:size) = a1(1:size);
    elseif ( test == 2 )
      a(1:size) = a2(1:size);
    elseif ( test == 3 )
      a(1:size) = a3(1:size);
    end

    r8slmat_print ( m, n, a, '  R8SLMAT' );
 
  end

  return
end
