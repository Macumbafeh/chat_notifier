-- SavedVariables: enabled, keywords

if enabled == nil then
  enabled = false;
end

if keywords == nil then
  keywords = {};
end


local chatFrame = CreateFrame("Frame");
chatFrame:RegisterEvent("CHAT_MSG_CHANNEL");
chatFrame:SetScript(
  "OnEvent",
  function(_, event, chatMessage, sender, language, channel)

    if not enabled then
      return nil;
    end

    local matched = false;
    for i = 1, #keywords do
      if (string.match(string.lower(chatMessage), string.lower(keywords[i]))) then
        matched = true;
        break;
      end
    end

    if matched then
      DEFAULT_CHAT_FRAME:AddMessage('[' .. sender .. ']: ' .. chatMessage);
    end

  end
);


SLASH_CN1 = '/cn';
function SlashCmdList.CN(slashMessage)

  if slashMessage == 'enabled' then
    if enabled then
        DEFAULT_CHAT_FRAME:AddMessage('ChatNotifier: enabled');
    else
      DEFAULT_CHAT_FRAME:AddMessage('ChatNotifier: disabled');
    end

    return nil;
  end

  if slashMessage == 'enable' then
    enabled = true;

    DEFAULT_CHAT_FRAME:AddMessage('ChatNotifier: enabled');

    return nil;
  end

  if slashMessage == 'disable' then
    enabled = false;

    DEFAULT_CHAT_FRAME:AddMessage('ChatNotifier: disabled');

    return nil;
  end

  if slashMessage == 'show' then

    if #keywords == 0 then
      DEFAULT_CHAT_FRAME:AddMessage('ChatNotifier: no keywords set');
    else
      DEFAULT_CHAT_FRAME:AddMessage('ChatNotifier: keywords list below');
  
      for i = 1, #keywords do
        DEFAULT_CHAT_FRAME:AddMessage(i .. '. ' .. keywords[i]);
      end
    end

    return nil;
  end

  if slashMessage == 'clear' then
    keywords = {};

    DEFAULT_CHAT_FRAME:AddMessage('ChatNotifier: keywords was cleared');

    return nil;
  end

  local firstArg, secondArg = string.match(slashMessage, '(.+)%s(.+)')

  if firstArg == 'add' then
    table.insert(keywords, secondArg);

    DEFAULT_CHAT_FRAME:AddMessage('ChatNotifier: keyword "' .. secondArg .. '" was added');

    return nil;
  end

  if firstArg == 'remove' then

    if keywords[tonumber(secondArg)] then
      local removedKeyword = table.remove(keywords, secondArg);
  
      DEFAULT_CHAT_FRAME:AddMessage('ChatNotifier: keyword "' .. removedKeyword .. '" was removed');
  
      return nil;
    else
      DEFAULT_CHAT_FRAME:AddMessage('ChatNotifier: keyword with index "' .. secondArg .. '" not found');
    end

  end

end