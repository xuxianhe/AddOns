local DGV = DugisGuideViewer
local UIFrameCache = DGV:RegisterModule("UIFrameCache")
UIFrameCache.essential = true
DGV.UIFrameCache = UIFrameCache

local caches
function UIFrameCache:Initialize()

    function UIFrameCache:Unload()
        caches = nil
    end

    function UIFrameCache:Load()
        caches = {}
        function UIFrameCache:New (frameType, baseName, parent, template)
            if ( self ~= UIFrameCache ) then
                error("Attempt to run factory method on class member");
            end

            local frameCache = {};

            setmetatable(frameCache, self);
            self.__index = self;

            frameCache.frameType = frameType;
            frameCache.baseName = baseName;
            frameCache.parent = parent;
            frameCache.template = template;
            frameCache.frames = {};
            frameCache.usedFrames = {};
            frameCache.numFrames = 0;

            tinsert(caches, frameCache);

            return frameCache;
        end

        function UIFrameCache:GetFrame ()
            local frame = self.frames[1];
            if ( frame ) then
                tremove(self.frames, 1);
                tinsert(self.usedFrames, frame);
                return frame;
            end

            frame = CreateFrame(self.frameType, self.baseName .. self.numFrames + 1, self.parent, self.template);
            frame.frameCache = self;
            self.numFrames = self.numFrames + 1;
            tinsert(self.usedFrames, frame);
            return frame;
        end

        function UIFrameCache:ReleaseFrame (frame)
            for k, v in next, self.frames do
                if ( v == frame ) then
                    return;
                end
            end

            for k, v in next, self.usedFrames do
                if ( v == frame ) then
                    tinsert(self.frames, frame);
                    tremove(self.usedFrames, k);
                    break;
                end
            end
        end
    end
end