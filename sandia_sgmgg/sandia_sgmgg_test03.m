function sandia_sgmgg_test03 ( )

%*****************************************************************************80
%
%% SANDIA_SGMGG_TEST03 sets up the GG data structure.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2011
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_SGMGG_TEST03:\n' );
  fprintf ( 1, '  Set up examples of the GG (Gerstner-Griebel)\n' );
  fprintf ( 1, '  data structure for generalized sparse grids.\n' );
%
%  Isotropic grid in 2D.
%
%  3 | 4
%  2 | 3  7
%  1 | 2  6  9
%  0 | 1  5  8 10
%    +-----------
%      0  1  2  3
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  1) Isotropic grid in 2D\n' );

  gg_na = 4;
  gg_nd = 2;
  gg_ni = 10;
  gg_no = 6;

  gg_ma = 20;
  gg_mi = 20;
  gg_mo = 20;

  gg_a = [ 4, 7, 9, 10 ]';

  gg_b = [ ...
    -1, -1; ...
    -1,  1; ...
    -1,  2; ...
    -1,  3; ...
     1, -1; ...
     2,  5; ...
     3,  6; ...
     5, -1; ...
     6,  8; ...
     8, -1 ]';

  gg_f = [ ...
     5,  2; ...
     6,  3; ...
     7,  4; ...
    -1, -1; ...
     8,  6; ...
     9,  7; ...
    -1, -1; ...
    10,  9; ...
    -1, -1; ...
    -1, -1 ]';

  gg_g = [
    0.1, 1.1, 2.2, 3.0, 1.0, ...
    2.1, 3.2, 2.0, 3.3, 3.1 ]';

  gg_i = [ ...
    0, 0; ...
    0, 1; ...
    0, 2; ...
    0, 3; ...
    1, 0; ...
    1, 1; ...
    1, 2; ...
    2, 0; ...
    2, 1; ...
    3, 0 ]';

  gg_o = [ 1, 2, 3, 5, 6, 8 ]';

  gg_s = [ 0, 0, 0, 1, 0, 0, 1, 0, 1, 1 ]';
%
%  Implicit decreasing heap sort on GG_G and GG_A
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Before Heap:\n' );
  fprintf ( 1, '     I     A      G\n' );
  fprintf ( 1, '\n' );

  for i = 1 : gg_na
    fprintf ( 1, '  %4d  %4d  %14g\n', i, gg_a(i), gg_g(gg_a(i)) );
  end

  gg_a = r8vec_indexed_heap_d ( gg_na, gg_g, gg_a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  After Heap:\n' );
  fprintf ( 1, '     I     A      G\n');
  fprintf ( 1, '\n' );

  for i = 1 : gg_na
    fprintf ( 1, '  %4d  %4d  %14g\n', i, gg_a(i), gg_g(gg_a(i)) );
  end
%
%  Print out the current data structure:
%
  sgmgg_print ( gg_ma, gg_mi, gg_mo, gg_na, gg_nd, gg_ni, gg_no, ...
    gg_a, gg_b, gg_f, gg_g, gg_i, gg_o, gg_s );
%
%  Now identify the active index with maximum error indicator.
%
  indx_max = r8vec_indexed_heap_d_max ( gg_na, gg_g, gg_a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum error indicator G(%d) = %f\n', ...
    indx_max, gg_g(indx_max) );
%
%  We are going to move INDX_MAX from the active to the old list.
%
%  1) Extract INDX_MAX from the active heap.
%     This automatically decrements GG_NA by 1.
%
  [ indx_max, gg_na, gg_a ] = r8vec_indexed_heap_d_extract ( gg_na, ...
    gg_g, gg_a );
%
%  2) Add INDX_MAX to the old list.
%
  gg_no = gg_no + 1;
  gg_o(gg_no) = indx_max;
  gg_s(indx_max) = 0;
%
%  3) Determine new index sets which are forward neighbors of INDX_MAX.
%     For each index set J found:
%     a) update forward neighbor array of INDX_MAX;
%     b) update backward neighbor array of J;
%     c) add J to A, increment NA
%     d) compute G(J) and add to G heap
%
  for d1 = 1 : gg_nd

    d2 = i4_wrap ( d1 + 1, 1, gg_nd );

    nb = gg_b(d2,indx_max);
    indx_nab = gg_f(d1,nb);

    if ( indx_nab == -1 )
      continue;
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Extension in direction D1 = %d is legal.\n', d1 );
    fprintf ( 1, '  NB = %d\n', nb );
    fprintf ( 1, '  INDX_NAB = %d\n', indx_nab );

    gg_ni = gg_ni + 1;
    indx_new = gg_ni;

    gg_i(1:gg_nd,indx_new) = gg_i(1:gg_nd,indx_max);
    gg_i(d1,indx_new) = gg_i(d1,indx_new) + 1;

    gg_b(1:gg_nd,indx_new) = -1;
    gg_f(1:gg_nd,indx_new) = -1;

    gg_b(d1,indx_new) = indx_max;
    gg_f(d1,indx_max) = indx_new;

    gg_b(d2,indx_new) = indx_nab;
    gg_f(d2,indx_nab) = indx_new;
%
%  Check whether there are any new neighbor relations in the remaining
%  directions D + 2, D + 3, ..., D + ND - 1.
%
    for d2 = d1 + 2 : d1 + gg_nd - 1

      d3 = i4_wrap ( d2, 1, gg_nd );

      nb = gg_b(d3,indx_max);
      indx_nab = gg_f(d1,nb);

      if ( indx_nab == -1 )
        continue;
      end

      gg_b(d3,indx_new) = indx_nab;
      gg_f(d3,indx_nab) = indx_new;

    end

    gg_s(indx_new) = 1;
    [ gg_g(indx_new), seed ] = r8_uniform_01 ( seed );
    [ gg_na, gg_a ] = r8vec_indexed_heap_d_insert ( gg_na, gg_g, gg_a, indx_new );
%
%  Print out the current data structure:
%
    sgmgg_print ( gg_ma, gg_mi, gg_mo, gg_na, gg_nd, gg_ni, gg_no, ...
      gg_a, gg_b, gg_f, gg_g, gg_i, gg_o, gg_s );

  end

  return
end
