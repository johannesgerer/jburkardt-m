function [idx, tri] = nearest_neighbor ( varargin )
%NEAREST_NEIGHBOR    find nearest neighbors
%   IDX = NEAREST_NEIGHBOR(X) finds the nearest neighbor by Euclidean
%   distance to each point (column) in X from X. X is a matrix with points
%   as columns. IDX is a vector of indices into X, such that X(:, IDX) are
%   the nearest neighbors to X. e.g. the nearest neighbor to X(:, 2) is
%   X(:, IDX(2))
%
%   IDX = NEAREST_NEIGHBOR(P, X) finds the nearest neighbor by Euclidean
%   distance to each point in P from X. P and X are both matrices with the
%   same number of rows, and points are the columns of the matrices. Output
%   is a vector of indices into X such that X(:, IDX) are the nearest
%   neighbors to P
%
%   IDX = NEAREST_NEIGHBOR(I, X) where I is a logical vector or vector of
%   indices, and X has at least two rows, finds the nearest neighbor in X
%   to each of the points X(:, I).
%   I must be a row vector to distinguish it from a single point.
%   If X has only one row, the first input is treated as a set of 1D points
%   rather than a vector of indices
%
%   IDX = NEAREST_NEIGHBOR(..., Property, Value)
%   Calls NEAREST_NEIGHBOR with the indicated parameters set. Property
%   names can be supplied as just the first letters of the property name if
%   this is unambiguous, e.g. NEAREST_NEIGHBOR(..., 'num', 5) is equivalent
%   to NEAREST_NEIGHBOR(..., 'NumberOfNeighbors', 5). Properties are case
%   insensitive, and are as follows:
%      Property:                         Value:
%      ---------                         ------
%         NumberOfNeighbors             natural number, default 1
%            NEAREST_NEIGHBOR(..., 'NumberOfNeighbors', K) finds the closest
%            K points in ascending order to each point, rather than the
%            closest point. If Radius is specified and there are not
%            sufficient numbers, fewer than K neighbors may be returned
%
%         Radius                         positive, default +inf
%            NEAREST_NEIGHBOR(..., 'Radius', R) finds neighbors within
%            radius R. If NumberOfNeighbors is not set, it will find all
%            neighbors within R, otherwise it will find at most
%            NumberOfNeighbors. The IDX matrix is padded with zeros if not
%            all points have the same number of neighbors returned. Note
%            that specifying a radius means that the Delaunay method will
%            not be used.
%
%         DelaunayMode                   {'on', 'off', |'auto'|}
%            DelaunayMode being set to 'on' means NEAREST_NEIGHBOR uses the
%            a Delaunay triangulation with dsearchn to find the points, if
%            possible. Setting it to 'auto' means NEAREST_NEIGHBOR decides
%            whether to use the triangulation, based on efficiency. Note
%            that the Delaunay triangulation will not be used if a radius
%            is specified.
%
%         Triangulation                  Valid triangulation produced by
%                                        delaunay or delaunayn
%            If a triangulation is supplied, NEAREST_NEIGHBOR will attempt
%            to use it (in conjunction with dsearchn) to find the
%            neighbors.
%
%   [IDX, TRI] = NEAREST_NEIGHBOR( ... )
%   If the Delaunay Triangulation is used, TRI is the triangulation of X'.
%   Otherwise, TRI is an empty matrix
%
%   Example:
%
%     % Find the nearest neighbor in X to each column of X
%     x = rand(2, 10);
%     idx = nearest_neighbor(x);
%
%     % Find the nearest neighbors to each point in p
%     p = rand(2, 5);
%     x = rand(2, 20);
%     idx = nearest_neighbor(p, x)
%
%     % Find the five nearest neighbors to points x(:, [1 6 20]) in x
%     x = rand(4, 1000)
%     idx = nearest_neighbor([1 6 20], x, 'NumberOfNeighbors', 5)
%
%     % Find all neighbors within radius of 0.1 of the points in p
%     p = rand(2, 10);
%     x = rand(2, 100);
%     idx = nearest_neighbor(p, x, 'r', 0.1)
%
%     % Find at most 10 nearest neighbors to point p from x within a
%     % radius of 0.2
%     p = rand(1, 2);
%     x = rand(2, 30);
%     idx = nearest_neighbor(p, x, 'n', 10, 'r', 0.2)
%
%
%   See also DELAUNAYN, DSEARCHN, TSEARCH

%TODO    Allow other metrics than Euclidean distance
%TODO    Implement the Delaunay mode for multiple neighbors

% Copyright 2006 Richard Brown. This code may be freely used and
% distributed, so long as it maintains this copyright line
error(nargchk(1, Inf, nargin, 'struct'));

% Default parameters
userParams.NumberOfNeighbors = []    ; % Finds one
userParams.DelaunayMode       = 'auto'; % {'on', 'off', |'auto'|}
userParams.Triangulation      = []    ;
userParams.Radius             = inf   ;

% Parse inputs
[P, X, fIndexed, userParams] = parseinputs(userParams, varargin{:});

% Special case uses Delaunay triangulation for speed.

% Determine whether to use Delaunay - set fDelaunay true or false
nX  = size(X, 2);
nP  = size(P, 2);
dim = size(X, 1);

switch lower(userParams.DelaunayMode)
    case 'on'
        %TODO Delaunay can't currently be used for finding more than one
        %neighbor
        fDelaunay = userParams.NumberOfNeighbors == 1 && ...
            size(X, 2) > size(X, 1)                    && ...
            ~fIndexed                                  && ...
            userParams.Radius == inf;
    case 'off'
        fDelaunay = false;
    case 'auto'
        fDelaunay = userParams.NumberOfNeighbors == 1 && ...
            ~fIndexed                                  && ...
            size(X, 2) > size(X, 1)                    && ...
            userParams.Radius == inf                   && ...
            ( ~isempty(userParams.Triangulation) || delaunaytest(nX, nP, dim) );
end

% Try doing Delaunay, if fDelaunay.
fDone = false;
if fDelaunay
    tri = userParams.Triangulation;
    if isempty(tri)
        try
            tri   = delaunayn(X');
        catch
            msgId = 'Nearest_Neighbor:DelaunayFail';
            msg = ['Unable to compute delaunay triangulation, not using it. ',...
                'Set the DelaunayMode parameter to ''off'''];
            warning(msgId, msg);
        end
    end
    if ~isempty(tri)
        try
            idx = dsearchn(X', tri, P')';
            fDone = true;
        catch
            warning('Nearest_Neighbor:DSearchFail', ...
                'dsearchn failed on triangulation, not using Delaunay');
        end
    end
else % if fDelaunay
    tri = [];
end

% If it didn't use Delaunay triangulation, find the neighbors directly by
% finding minimum distances
if ~fDone
    idx = zeros(userParams.NumberOfNeighbors, size(P, 2));

    % Loop through the set of points P, finding the neighbors
    Y = zeros(size(X));
    for iPoint = 1:size(P, 2)
        x = P(:, iPoint);

        % This is the faster than using repmat based techniques such as
        % Y = X - repmat(x, 1, size(X, 2))
        for i = 1:size(Y, 1)
            Y(i, :) = X(i, :) - x(i);
        end

        % Find the closest points, and remove matches beneath a radius
        dSq = sum(abs(Y).^2, 1);
        iRad = find(dSq < userParams.Radius^2);
        if ~fIndexed
            iSorted = iRad(minn(dSq(iRad), userParams.NumberOfNeighbors));
        else
            iSorted = iRad(minn(dSq(iRad), userParams.NumberOfNeighbors + 1));
            iSorted = iSorted(2:end);
        end

        % Remove any bad ones
        idx(1:length(iSorted), iPoint) = iSorted';
    end
    %while ~isempty(idx) && isequal(idx(end, :), zeros(1, size(idx, 2)))
    %    idx(end, :) = [];
    %end
    idx( all(idx == 0, 2), :) = [];
end % if ~fDone
if isvector(idx)
    idx = idx(:)';
end
end % nearestneighbor




%DELAUNAYTEST   Work out whether the combination of dimensions makes
%fastest to use a Delaunay triangulation in conjunction with dsearchn.
%These parameters have been determined empirically on a Pentium M 1.6G /
%WinXP / 512MB / Matlab R14SP3 platform. Their precision is not
%particularly important
function tf = delaunaytest(nx, np, dim)
switch dim
    case 2
        tf = np > min(1.5 * nx, 400);
    case 3
        tf = np > min(4 * nx  , 1200);
    case 4
        tf = np > min(40 * nx , 5000);

        % if the dimension is higher than 4, it is almost invariably better not
        % to try to use the Delaunay triangulation
    otherwise
        tf = false;
end % switch
end % delaunaytest




%MINN   find the n most negative elements in x, and return their indices
%  in ascending order
function I = minn(x, n)

% Make sure n is no larger than length(x)
n = min(n, length(x));

% Sort the first n
[xsn, I] = sort(x(1:n));

% Go through the rest of the entries, and insert them into the sorted block
% if they are negative enough
for i = (n+1):length(x)
    j = n;
    while j > 0 && x(i) < xsn(j)
        j = j - 1;
    end

    if j < n
        % x(i) should go into the (j+1) position
        xsn = [xsn(1:j), x(i), xsn((j+1):(n-1))];
        I   = [I(1:j), i, I((j+1):(n-1))];
    end
end

end %minn


%PARSEINPUTS    Support function for nearestneighbor
function [P, X, fIndexed, userParams] = parseinputs(userParams, varargin)
if length(varargin) == 1 || ~isnumeric(varargin{2})
    P           = varargin{1};
    X           = varargin{1};
    fIndexed    = true;
    varargin(1) = [];
else
    P             = varargin{1};
    X             = varargin{2};
    varargin(1:2) = [];

    % Check the dimensions of X and P
    if size(X, 1) ~= 1
        % Check to see whether P is in fact a vector of indices
        if size(P, 1) == 1
            try
                P = X(:, P);
            catch
                error('Nearest_Neighbor:InvalidIndexVector', ...
                    'Unable to index matrix using index vector');
            end
            fIndexed = true;
        else
            fIndexed = false;
        end % if size(P, 1) == 1
    else % if size(X, 1) ~= 1
        fIndexed = false;
    end

    if ~fIndexed && size(P, 1) ~= size(X, 1)
        error('Nearest_Neighbor:DimensionMismatch', ...
            'No. of rows of input arrays doesn''t match');
    end
end
% Parse the Property/Value pairs
if rem(length(varargin), 2) ~= 0
    error('Nearest_Neighbor:propertyValueNotPair', ...
        'Additional arguments must take the form of Property/Value pairs');
end

propertyNames = {'numberofneighbors', 'delaunaymode', 'triangulation', ...
    'radius'};
while length(varargin) ~= 0
    property = varargin{1};
    value    = varargin{2};

    % If the property has been supplied in a shortened form, lengthen it
    iProperty = find(strncmpi(property, propertyNames, length(property)));
    if isempty(iProperty)
        error('Nearest_Neighbor:InvalidProperty', 'Invalid Property');
    elseif length(iProperty) > 1
        error('Nearest_Neighbor:AmbiguousProperty', ...
            'Supplied shortened property name is ambiguous');
    end
    property = propertyNames{iProperty};

    switch property
        case 'numberofneighbors'
            if rem(value, 1) ~= 0 || ...
                    value > length(X) - double(fIndexed) || ...
                    value < 1
                error('Nearest_Neighbor:InvalidNumberOfNeighbors', ...
                    'Number of Neighbors must be an integer, and smaller than the no. of points in X');
            end
            userParams.NumberOfNeighbors = value;

        case 'delaunaymode'
            fOn = strcmpi(value, 'on');
            if strcmpi(value, 'off')
                userParams.DelaunayMode = 'off';
            elseif fOn || strcmpi(value, 'auto')
                if userParams.NumberOfNeighbors ~= 1
                    if fOn
                        warning('Nearest_Neighbor:TooMuchForDelaunay', ...
                            'Delaunay Triangulation method works only for one neighbor');
                    end
                    userParams.DelaunayMode = 'off';
                elseif size(X, 2) < size(X, 1) + 1
                    if fOn
                        warning('Nearest_Neighbor:TooFewDelaunayPoints', ...
                            'Insufficient points to compute Delaunay triangulation');
                    end
                    userParams.DelaunayMode = 'off';

                elseif size(X, 1) == 1
                    if fOn
                        warning('Nearest_Neighbor:DelaunayDimensionOne', ...
                            'Cannot compute Delaunay triangulation for 1D input');
                    end
                    userParams.DelaunayMode = 'off';
                else
                    userParams.DelaunayMode = value;
                end
            else
                warning('Nearest_Neighbor:InvalidOption', ...
                    'Invalid Option');
            end % if strcmpi(value, 'off')

        case 'radius'
            if isscalar(value) && isnumeric(value) && isreal(value) && value > 0
                userParams.Radius = value;
                if isempty(userParams.NumberOfNeighbors)
                    userParams.NumberOfNeighbors = size(X, 2) - double(fIndexed);
                end
            else
                error('Nearest_Neighbor:InvalidRadius', ...
                    'Radius must be a positive real number');
            end
    

        case 'triangulation'
            if isnumeric(value) && size(value, 2) == size(X, 1) + 1 && ...
                    all(ismember(1:size(X, 2), value))
                userParams.Triangulation = value;
            else
                error('Nearest_Neighbor:InvalidTriangulation', ...
                    'Triangulation not a valid Delaunay Triangulation');
            end
    end % switch property

    varargin(1:2) = [];
end % while
if isempty(userParams.NumberOfNeighbors)
    userParams.NumberOfNeighbors = 1;
end
end %parseinputs
