function hh = sparsearea(varargin)

if nargin == 1
    validateattributes(varargin{1},{'numeric'},{'2d'})
    h = gca;
    y = varargin{1};
    x = 1:length(y);
    p = {};
    
elseif nargin == 2
    validateattributes(varargin{1},{'numeric','handle'},{'2d'})
    validateattributes(varargin{2},{'numeric'},{'2d'})
    if ishandle(varargin{1})
        h = varargin{1};
        y = varargin{2};
        x = 1:length(y);
    else
        h = gca;
        x = varargin{1};
        y = varargin{2};
    end
    p = {};
    
elseif nargin > 2
    if ishandle(varargin{1})
        validateattributes(varargin{2},{'numeric'},{'2d'})
        validateattributes(varargin{3},{'numeric'},{'2d'})
        h = varargin{1};
        x = varargin{2};
        y = varargin{3};
        if nargin>3
            p = varargin(4:end);
        else
            p = {};
        end
    else
        h = gca;
        x = varargin{1};
        y = varargin{2};
        p = varargin(3:end);
    end
end

[msg,x,y] = xychk(x,y,'plot');
if ~isempty(msg), error(msg); end

i = unique([1; find(diff(diff(y)))+1; length(y)]);

h = area(h,x(i),y(i),p{:});
if nargout>0, hh = h; end;