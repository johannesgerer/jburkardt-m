function bvec3 = bvec_mul ( n, bvec1, bvec2 )

%*****************************************************************************80
%
%% BVEC_MUL computes the product of two binary vectors.
%
%  Discussion:
%
%    A BVEC is an integer vector of binary digits, intended to
%    represent an integer.  BVEC(1) is the units digit, BVEC(N-1)
%    is the coefficient of 2^(N-2), and BVEC(N) contains sign
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
%    Input, integer BVEC1(N), BVEC2(N), the vectors to be multiplied.
%
%    Output, integer BVEC3(N), the product of the two input vectors.
%
  base = 2;
%
%  Copy the input.
%
  bveca(1:n) = bvec1(1:n);
  bvecb(1:n) = bvec2(1:n);
%
%  Record the sign of the product.
%  Make the factors positive.
%
  product_sign = 1;

  if ( bveca(n) ~= 0 )
    product_sign = - product_sign;
    bveca = bvec_complement2 ( n, bveca );
  end

  if ( bvecb(n) ~= 0 )
    product_sign = - product_sign;
    bvecb = bvec_complement2 ( n, bvecb );
  end

  bvecc(1:n) = 0;
%
%  Multiply.
%
  for i = 1 : n - 1
    bvecc(i:n-1) = bvecc(i:n-1) + bveca(i) * bvecb(1:n-i);
  end
%
%  Take care of carries.
%
  for i = 1 : n-1

    carry = floor ( bvecc(i) / base );
    bvecc(i) = bvecc(i) - carry * base;
%
%  Unlike the case of BVEC_ADD, we do NOT allow carries into
%  the N-th position when multiplying.
%
    if ( i < n - 1 )
      bvecc(i+1) = bvecc(i+1) + carry;
    end

  end
%
%  Take care of the sign of the product.
%
  if ( product_sign < 0 )
    bvecc = bvec_complement2 ( n, bvecc );
  end
%
%  Copy the output.
%
  bvec3(1:n) = bvecc(1:n);

  return
end
