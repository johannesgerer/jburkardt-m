function [ est1, err1, dev1, est2, err2, dev2, eval_num ] = sample_nd ( ...
  func, k1, k2, dim_num )

%*****************************************************************************80
%
%% SAMPLE_ND estimates a multidimensional integral using sampling.
%
%  Discussion:
%
%    This routine computes two sequences of integral estimates, EST1 
%    and EST2, for indices K going from K1 to K2.  These estimates are 
%    produced by the generation of 'random' abscissas in the region.  
%    The process can become very expensive if high accuracy is needed.
%
%    The total number of function evaluations is
%    4*(K1**DIM_NUM+(K1+1)**DIM_NUM+...+(K2-1)**DIM_NUM+K2**DIM_NUM), and K2
%    should be chosen so as to make this quantity reasonable.
%    In most situations, EST2(K) are much better estimates than EST1(K).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2007
%
%  Author:
%
%    Original FORTRAN77 version by Philip Davis, Philip Rabinowitz.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%  Parameters:
%
%    Input, function FUNC ( DIM_NUM, X ), the name of the function 
%    to be evaluated.
%
%    Input, integer K1, the beginning index for the iteration.
%    1 <= K1 <= K2.
%
%    Input, integer K2, the final index for the iteration.  K1 <= K2.
%    Increasing K2 increases the accuracy of the calculation,
%    but vastly increases the work and running time of the code.
%
%    Input, integer DIM_NUM, the spatial dimension.  1 <= DIM_NUM <= 10.
%
%    Output, real EST1(K2).  Entries K1 through K2 contain
%    successively better estimates of the integral.
%
%    Output, real ERR1(K2).  Entries K1 through K2 contain
%    the corresponding estimates of the integration errors.
%
%    Output, real DEV1(K2).  Entries K1 through K2 contain
%    estimates of the reliability of the the integration.
%    If consecutive values DEV1(K) and DEV1(K+1) do not differ
%    by more than 10 percent, then ERR1(K) can be taken as
%    a reliable upper bound on the difference between EST1(K)
%    and the true value of the integral.
%
%    Output, real EST2(K2).  Entries K2 through K2 contain
%    successively better estimates of the integral.
%
%    Output, real ERR2(K2).  Entries K2 through K2 contain
%    the corresponding estimates of the integration errors.
%
%    Output, real DEV2(K2).  Entries K2 through K2 contain
%    estimates of the reliability of the the integration.
%    If consecutive values DEV2(K) and DEV2(K+2) do not differ
%    by more than 10 percent, then ERR2(K) can be taken as
%    a reliable upper bound on the difference between EST2(K)
%    and the true value of the integral.
%
%    Output, integer EVAL_NUM, the number of function evaluations.
%
  dim_max = 10;
  al =  [ ...
       0.4142135623730950, ...
       0.7320508075688773, ...
       0.2360679774997897, ...
       0.6457513110645906, ...
       0.3166247903553998, ...
       0.6055512754639893, ...
       0.1231056256176605, ...
       0.3589989435406736, ...
       0.7958315233127195, ...
       0.3851648071345040 ];

  eval_num = 0;
%
%  Check input
%
  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SAMPLE_ND - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM must be at least 1, but DIM_NUM = %d\n', dim_num );
    error ( 'SAMPLE_ND - Fatal error!' );
  end
 
  if ( dim_max < dim_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SAMPLE_ND - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM must be no more than DIM_MAX = %d\n', dim_max );
    fprintf ( 1, '  but DIM_NUM = %d\n', dim_num );
    error ( 'SAMPLE_ND - Fatal error!' );
  end
 
  if ( k1 < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SAMPLE_ND - Fatal error!\n' );
    fprintf ( 1, '  K1 must be at least 1, but K1 = %d\n', k1 );
    error ( 'SAMPLE_ND - Fatal error!' );
  end
 
  if ( k2 < k1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SAMPLE_ND - Fatal error!\n' );
    fprintf ( 1, '  K1 may not be greater than K2, but \n' );
    fprintf ( 1, '  K1 = %d\n', k1 );
    fprintf ( 1, '  K2 = %d\n', k2 );
    error ( 'SAMPLE_ND - Fatal error!' );
  end
 
  be(1:dim_num) = al(1:dim_num);
  ga(1:dim_num) = al(1:dim_num);
  dex(1:dim_num) = 0.0;
 
  est1(1:k1-1) = 0.0;
  err1(1:k1-1) = 0.0;
  dev1(1:k1-1) = 0.0;
  est2(1:k1-1) = 0.0;
  err2(1:k1-1) = 0.0;
  dev2(1:k1-1) = 0.0;

  for k = k1 : k2
 
    ak = k;
    key = 0;
    ak1 = ak - 1.1;
    s1 = 0.0;
    d1 = 0.0;
    s2 = 0.0;
    d2 = 0.0;
    akn = ak^dim_num;
    t = sqrt ( ak^dim_num ) * ak;
    bk = 1.0 / ak;
 
    while ( 1 )
 
      key = key + 1;

      if ( key ~= 1 )

        key = key - 1;
        more = 0;
 
        for j = 1 : dim_num
 
          if ( dex(j) <= ak1 )
            dex(j) = dex(j) + 1.0;
            more = 1;
            break;
          end
 
          dex(j) = 0.0;

        end
 
        if ( ~more )
          break
        end

      end
 
      for i = 1 : dim_num

        b = be(i) + al(i);
        if ( 1.0 < b )
          b = b - 1.0;
        end

        g = ga(i) + b;
        if ( 1.0 < g )
          g = g - 1.0;
        end

        be(i) = b + al(i);
        if ( 1.0 < be(i) )
          be(i) = be(i) - 1.0;
        end

        ga(i) = be(i) + g;
        if ( 1.0 < ga(i) )
          ga(i) = ga(i) - 1.0;
        end

        p1(i) = ( dex(i) + g ) * bk;
        p2(i) = ( dex(i) + 1.0 - g ) * bk;
        p3(i) = ( dex(i) + ga(i) ) * bk;
        p4(i) = ( dex(i) + 1.0 - ga(i) ) * bk;

      end
 
      y1 = feval ( func, dim_num, p1 );
      eval_num = eval_num + 1;
%
%  There may be an error in the next two lines,
%  but oddly enough, that is how the original reads
%
      y3 = feval ( func, dim_num, p2 );
      eval_num = eval_num + 1;
      y2 = feval ( func, dim_num, p3 );
      eval_num = eval_num + 1;
      y4 = feval ( func, dim_num, p4 );
      eval_num = eval_num + 1;

      s1 = s1 + y1 + y2;
      d1 = d1 + ( y1 - y2 )^2;
      s2 = s2 + y3 + y4;
      d2 = d2 + ( y1 + y3 - y2 - y4 )^2;

    end
  
    est1(k) = 0.5 * s1 / akn;
    err1(k) = 1.5 * sqrt ( d1 ) / akn;
    dev1(k) = err1(k) * t;
    est2(k) = 0.25 * ( s1 + s2 ) / akn;
    err2(k) = 0.75 * sqrt ( d2 ) / akn;
    dev2(k) = err2(k) * t * ak;
 
  end

  return
end
