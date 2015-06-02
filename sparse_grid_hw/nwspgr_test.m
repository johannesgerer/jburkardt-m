function nwspgr_test ( )

%*****************************************************************************80
%
%% NWSPGR_TEST tests the NWSPGR function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NWSPGR_TEST:\n' );
  fprintf ( 1, '  NWSPGR generates a sparse grid, based on either:\n' );
  fprintf ( 1, '  one of the built-in 1D rules, or a family of 1D rules\n' );
  fprintf ( 1, '  supplied by the user.\n' );

  [ x, w ] = nwspgr ( 'kpu', 2, 3, 1 );
  x = x';
  [ m, n ] = size ( x );
  quad_rule_print ( m, n, x, w, '  Kronrod-Patterson, [0,1], Dim 2, Level 3' );

  [ x, w ] = nwspgr ( 'kpn', 2, 3, 1 );
  x = x';
  [ m, n ] = size ( x );
  quad_rule_print ( m, n, x, w, '  Kronrod-Patterson, (-oo,+oo), Dim 2, Level 3' );

  [ x, w ] = nwspgr ( 'gqu', 2, 3, 1 );
  x = x';
  [ m, n ] = size ( x );
  quad_rule_print ( m, n, x, w, '  Gauss-Legendre, [0,1], Dim 2, Level 3' );

  [ x, w ] = nwspgr ( 'gqn', 2, 3, 1 );
  x = x';
  [ m, n ] = size ( x );
  quad_rule_print ( m, n, x, w, '  Gauss Hermite, (-oo,+oo), Dim 2, Level 3' );

  [ x, w ] = nwspgr ( 'cce', 2, 3, 1 );
  x = x';
  [ m, n ] = size ( x );
  quad_rule_print ( m, n, x, w, ...
    '  Clenshaw Curtis Exponential, [-1,+1], Dim 2, Level 3' );

  return
end
