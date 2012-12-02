function subpak_test060 ( )

%*****************************************************************************80
%
%% TEST060 tests R8MAT_HOUSE_FORM.
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
  n = 5;

  v = [ 0.0, 0.0, 1.0, 2.0, 3.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST060\n' );
  fprintf ( 1, '  R8MAT_HOUSE_FORM forms a Householder\n' );
  fprintf ( 1, '    matrix from its compact form.\n' );

  r8vec_print ( n, v, '  Compact vector form V:' );

  h = r8mat_house_form ( n, v );
 
  r8mat_print ( n, n, h, '  Householder matrix H:' );
 
  return
end
