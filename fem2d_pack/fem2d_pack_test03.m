function fem2d_pack_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests the BASIS_11_**_TEST routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  BASIS_11_T3_TEST tests BASIS_11_T3.\n' );
  fprintf ( 1, '  BASIS_11_T4_TEST tests BASIS_11_T4.\n' );
  fprintf ( 1, '  BASIS_11_T6_TEST tests BASIS_11_T6.\n' );

  basis_11_t3_test ( );

  basis_11_t4_test ( );

  basis_11_t6_test ( );

  return
end


