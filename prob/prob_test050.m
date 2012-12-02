function prob_test050 ( )

%*****************************************************************************80
%
%% TEST050 tests DIRICHLET_MIX_PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  comp_num = 2;
  elem_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST050\n' );
  fprintf ( 1, '  For the Dirichlet mixture PDF:\n' );
  fprintf ( 1, '  DIRICHLET_MIX_PDF evaluates the PDF.\n' );

  x(1:3) = [ 0.500, 0.125, 0.375 ];

  a(1:3,1:2) = [ 0.250, 1.500; ...
                 0.500, 0.500; ...
                 1.250, 2.000 ];

  comp_weight(1:2) = [ 1.0, 2.0 ];

  check = dirichlet_mix_check ( comp_num, elem_num, a, comp_weight );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST050 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end
  
  fprintf ( 1, '  Number of elements ELEM_NUM =   %6d\n', elem_num );
  fprintf ( 1, '  Number of components COMP_NUM = %6d\n', comp_num );
  fprintf ( 1, '  PDF parameters A(ELEM,COMP):\n' );
  fprintf ( 1, '\n' );
  for elem_i = 1 : elem_num
    fprintf ( 1, '  %14f  %14f\n', a(elem_i,1:comp_num) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Component weights:\n' );
  fprintf ( 1, '\n' );
  for comp_i = 1 : comp_num
    fprintf ( 1, '  %6d  %14f\n', comp_i, comp_weight(comp_i) );
  end

  pdf = dirichlet_mix_pdf ( x, comp_num, elem_num, a, comp_weight );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF value =           %14f\n', pdf );

  return
end
