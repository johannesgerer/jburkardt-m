function nintlib_test05 ( dim_num, func )

%*****************************************************************************80
%
%% NINTLIB_TEST05 demonstrates refinement.
%
%  Discussion:
%
%    This routine is only set up for DIM_NUM = 2 for now.
%
%    We are given a routine, NDP5, which will integrate over a
%    DIM_NUM dimensional hypercube using a fixed method.  In order to
%    improve the approximation to an integral, we can subdivide
%    the hypercube and call NDP5 to integrate again over each of
%    these regions.
%
%    The information that we gather can be used to tell us when
%    to expect that we have achieved a certain degree of accuracy.
%
%    With a little more work, we could make this code adaptive.
%    That is, it would only refine SOME of the subregions, where
%    the approximation to the integral was still not good enough.
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
  xlo(1:dim_num) = 0.0;
  xhi(1:dim_num) = 1.0;
 
  for igrid = 1 : 6
 
    ngrid = 2^( igrid - 1 );

    result_total = 0.0;
    eval_total = 0;
 
    for i = 1 : ngrid
 
      a(1) = ( ( ngrid - i + 1 ) * xlo(1)   ...
             + (         i - 1 ) * xhi(1) ) ...
             /   ngrid;

      b(1) = ( ( ngrid - i ) * xlo(1)   ...
             + (         i ) * xhi(1) ) ...
             /   ngrid;
  
      for j = 1 : ngrid

        a(2) = ( ( ngrid - j + 1 ) * xlo(2)   ...
               + (         j - 1 ) * xhi(2) ) ...
               /   ngrid;

        b(2) = ( ( ngrid - j ) * xlo(2)   ...
               + (         j ) * xhi(2) ) ...
               /   ngrid;

        [ result, eval_num ] = p5_nd ( func, dim_num, a, b );

        result_total = result_total + result;
        eval_total = eval_total + eval_num;

      end
 
    end
 
    fprintf ( 1, '  P5_ND+:         %20.12f  %8d\n', .....
      result_total, eval_total );
 
  end

  return
end
