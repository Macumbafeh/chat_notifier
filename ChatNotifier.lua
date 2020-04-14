-- SavedVariables: enabled, keyword

if enabled == nil then
  enabled = false;
end

if keyword == nil then
  keyword = 'empty keyword kekw';
end


local chatFrame = CreateFrame("Frame");
chatFrame:RegisterEvent("CHAT_MSG_CHANNEL");
chatFrame:SetScript(
  "OnEvent",
  function(_, event, chatMessage, sender, language, channel)

    if not enabled then
      return nil;
    end

    if not string.match(string.lower(channel), 'global') then
      return nil;
    end

    local isMatched = string.match(string.lower(chatMessage), string.lower(keyword));

    if isMatched then
      DEFAULT_CHAT_FRAME:AddMessage('[' .. sender .. ']: ' .. chatMessage);
    end

  end
);


SLASH_CN1 = '/cn';
function SlashCmdList.CN(slashMessage)

  if slashMessage == 'enabled' then
    if enabled then
        DEFAULT_CHAT_FRAME:AddMessage('addon is enabled');
    else
      DEFAULT_CHAT_FRAME:AddMessage('addon is disabled');
    end

    return nil;
  end

  if slashMessage == 'enable' then
    enabled = true;
    return nil;
  end

  if slashMessage == 'disable' then
    enabled = false;
    return nil;
  end

  if slashMessage == 'keyword' then
    DEFAULT_CHAT_FRAME:AddMessage('keyword is "' .. keyword .. '"');
    return nil;
  end

  local firstArg, secondArg = string.match(slashMessage, '(.+)%s(.+)')

  if firstArg == 'keyword' then
    keyword = secondArg;
    return nil;
  end

end