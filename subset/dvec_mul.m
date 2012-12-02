function dvec3 = dvec_mul ( n, dvec1, dvec2 )

%*****************************************************************************80
%
%% DVEC_MUL computes the product of two decimal vectors.
%
%  Discussion:
%
%    A DVEC is an integer vector of decimal digits, intended to
%    represent an integer.  DVEC(1) is the units digit, DVEC(N-1)
%    is the coefficient of 10**(N-2), and DVEC(N) contains sign
%    information.  It is 0 if the number is positive, and 1 if
%    the number is negative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the length of the vectors.
%
%    Input, integer DVEC1(N), DVEC2(N), the vectors to be multiplied.
%
%    Output, integer DVEC3(N), the product of the two input vectors.
%
  base = 10;
%
%  Copy the input.
%
  dveca(1:n) = dvec1(1:n);
  dvecb(1:n) = dvec2(1:n);
%
%  Record the sign of the product.
%  Make the factors positive.
%
  product_sign = 1;

  if ( dveca(n) ~= 0 )
    product_sign = - product_sign;
    dveca = dvec_complementx ( n, dveca );
  end

  if ( dvecb(n) ~= 0 )
    product_sign = - product_sign;
    dvecb = dvec_complementx ( n, dvecb );
  end

  dvecc(1:n) = 0;
%
%  Multiply.
%
  for i = 1 : n-1
    dvecc(i:n-1) = dvecc(i:n-1) + dveca(i) * dvecb(1:n-i);
  end
%
%  Take care of carries.
%
  for i = 1 : n-1

    carry = floor ( dvecc(i) / base );
    dvecc(i) = dvecc(i) - carry * base;
%
%  Unlike the case of DVEC_ADD, we do NOT allow carries into
%  the N-th position when multiplying.
%
    if ( i < n - 1 )
      dvecc(i+1) = dvecc(i+1) + carry;
    end

  end
%
%  Take care of the sign of the product.
%
  if ( product_sign < 0 )
    dvecc = dvec_complementx ( n, dvecc );
  end
%
%  Copy the output.
%
  dvec3(1:n) = dvecc(1:n);

  return
end
