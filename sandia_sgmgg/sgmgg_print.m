function sgmgg_print ( gg_ma, gg_mi, gg_mo, gg_na, gg_nd, gg_ni, gg_no, ...
  gg_a, gg_b, gg_f, gg_g, gg_i, gg_o, gg_s )

%*****************************************************************************80
%
%% SGMGG_PRINT prints out an SGMGG data structure.
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
%  Parameters:
%
%    Input, integer GG_MA, the maximum dimension for GG_A.
%
%    Input, integer GG_MI, the maximum dimension for GG_I.
%
%    Input, integer GG_MO, the maximum dimension for GG_O.
%
%    Input, integer GG_NA, the current dimension for GG_A.
%
%    Input, integer GG_ND, the spatial dimension.
%
%    Input, integer GG_NI, the current dimension for GG_I.
%
%    Input, integer GG_NO, the current dimension for GG_O.
%
%    Input, integer GG_A(GG_MA), the active indices.
%
%    Input, integer GG_B(GG_ND,GG_MI), the forward neighbors.
%
%    Input, integer GG_F(GG_ND,GG_MI), the backward neighbors.
%
%    Input, real GG_G(GG_MA), the error estimators.
%
%    Input, integer GG_I(GG_ND,GG_MI), the index set.
%
%    Input, integer GG_O(GG_MO), the old indices.
%
%    Input, integer GG_S(GG_MI), 0 if index I is old, 1
%    if it is active.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GG DATA STRUCTURE:\n' );
  fprintf ( 1, '  ND = %d\n', gg_nd );
  fprintf ( 1, '  NI = %d\n', gg_ni );
  fprintf ( 1, '  NO = %d\n', gg_no );
  fprintf ( 1, '  NA = %d\n', gg_na );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Indices:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I       A/O    G(I)        Index values\n' );
  fprintf ( 1, '\n' );
  for i = 1 : gg_ni
    if ( gg_s(i) == 0 )
      s = 'o';
    elseif ( gg_s(i) == 1 )
      s = 'a';
    else
      s = '?';
    end
    fprintf ( 1, '  %4d        %c  %14g', i, s, gg_g(i) );
    for j = 1 : gg_nd
      fprintf ( 1, '  %4d', gg_i(j,i) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Backward neighbors:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : gg_ni
    fprintf ( 1, '  %4d      ', i );
    for j = 1 : gg_nd 
      fprintf ( 1, '  %4d', gg_b(j,i) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Forward neighbors:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : gg_ni
    fprintf ( 1, '  %4d      ', i );
    for j = 1 : gg_nd 
      fprintf ( 1, '  %4d', gg_f(j,i) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Active Heap:\n' );
  fprintf ( 1, '     I     A      G\n' );
  fprintf ( 1, '\n' );

  for i = 1 : gg_na
    fprintf ( 1, '  %4d  %4d  %14g\n', i, gg_a(i), gg_g(gg_a(i)) );
  end

  return
end
