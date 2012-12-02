function nintlib_test01 ( dim_num, func )

%*****************************************************************************80
%
%% NINTLIB_TEST01 tests BOX_ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, function FUNC ( DIM_NUM, X ), the name of the function
%    to be integrated.
%
  order = 5;

  wtab = [ ...
    0.236926885056189087514264040720, ...
    0.478628670499366468041291514836, ...
    0.568888888888888888888888888889, ...
    0.478628670499366468041291514836, ...
    0.236926885056189087514264040720 ];
  xtab = [ ...
    -0.906179845938663992797626878299, ...
    -0.538469310105683091036314420700, ...
     0.0, ...
     0.538469310105683091036314420700, ...
     0.906179845938663992797626878299 ];
%
%  Adjust the quadrature rule from [-1,1] to [0,1]:
%
  xtab2(1:order) = ( xtab(1:order) + 1.0 ) / 2.0;
  wtab2(1:order) = 0.5 * wtab(1:order);

  [ result, eval_num ] = box_nd ( func, dim_num, order, xtab2, wtab2 );
    
  fprintf ( 1, '  BOX_ND:         %20.12f  %8d\n', result, eval_num );

  return
end
