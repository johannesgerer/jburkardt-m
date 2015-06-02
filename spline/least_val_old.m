function value = least_val_old ( x, ndeg, b, c, d )

%*****************************************************************************80
%
%% LEAST_VAL_OLD evaluates a least squares polynomial defined by LEAST_SET_OLD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 June 2013
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Gisela Engeln-Muellges and Frank Uhlig,
%    Numerical Algorithms with C, pages 191-193.
%    Springer, 1996.
%
%  Parameters:
%
%    Input, real X, the point at which the polynomial is to be evaluated.
%
%    Input, integer NDEG, the degree of the polynomial fit used.
%    This is the value of NDEG as returned from LEAST_SET.
%
%    Input, real B(1:NDEG), C(0:NDEG), D(2:NDEG), arrays defined by
%    LEAST_SET, and needed to evaluate the least squares polynomial.
%
%    Output, real VALUE, the value of the polynomial at X.
%
  C_OFFSET = 1;
  D_OFFSET = -1;
  
  if ( ndeg <= 0 )

    value = c(0+C_OFFSET);

  elseif ( ndeg == 1 )

    value = c(0+C_OFFSET) + c(1+C_OFFSET) * ( x - b(1) );

  else

    skp2 = c(ndeg+C_OFFSET);
    skp1 = c(ndeg-1+C_OFFSET) + ( x - b(ndeg) ) * skp2;

    for k = ndeg-2 : -1 : 0
      sk = c(k+C_OFFSET) + ( x - b(k+1) ) * skp1 - d(k+2+D_OFFSET) * skp2;
      skp2 = skp1;
      skp1 = sk;
    end

    value = sk;

  end

  return
end
