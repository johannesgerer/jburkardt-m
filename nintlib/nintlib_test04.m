function nintlib_test04 ( dim_num, func )

%*****************************************************************************80
%
%% NINTLIB_TEST04 tests SAMPLE_ND.
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
  k1 = 1;
  k2 = 4;
  
  [ est1, err1, dev1, est2, err2, dev2, eval_num ] = sample_nd ( ...
    func, k1, k2, dim_num );
 
  fprintf ( 1, '  SAMPLE_ND:      %20.12f  %8d\n', est2(k2), eval_num );
 
  return
end
