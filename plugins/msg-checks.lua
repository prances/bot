local TIME_CHECK = 1
local function pre_process(msg)
local data = load_data(_config.moderation.data)
local chat = msg.chat_id_
local user = msg.sender_user_id_
local is_channel = gp_type(chat) == "channel"
local is_chat = gp_type(chat) == "chat"
local auto_leave = 'auto_leave_bot'
local data = load_data(_config.moderation.data)
 msg.text = msg.content_.text_
  local groups = 'groups'
   if is_channel or is_chat then
    if msg.text then
  if msg.text:match("(.*)") then
    if not data[tostring(chat)] and not redis:get(auto_leave) and not is_admin(msg) then
  tdcli.sendMessage(msg.chat_id_, "", 0, "_This Is Not One Of My Groups_*", 0, "md")
  tdcli.changeChatMemberStatus(chat, our_id, 'Left', dl_cb, nil)
      end
   end
end
	    if msg.from.username then
        usname = " - @"..msg.from.username
        else
        usname = ""
        end
		
    if data[tostring(chat)] and data[tostring(chat)]['settings'] then
		settings = data[tostring(chat)]['settings']
	else
		return
	end
	if settings.mute_all then
		mute_all = settings.mute_all
	else
		mute_all = 'no'
	end
	if settings.mute_gif then
		mute_gif = settings.mute_gif
	else
		mute_gif = 'no'
	end
   if settings.mute_photo then
		mute_photo = settings.mute_photo
	else
		mute_photo = 'no'
	end
	if settings.mute_sticker then
		mute_sticker = settings.mute_sticker
	else
		mute_sticker = 'no'
	end
	if settings.mute_contact then
		mute_contact = settings.mute_contact
	else
		mute_contact = 'no'
	end
	if settings.mute_inline then
		mute_inline = settings.mute_inline
	else
		mute_inline = 'no'
	end
	if settings.mute_game then
		mute_game = settings.mute_game
	else
		mute_game = 'no'
	end
	if settings.mute_text then
		mute_text = settings.mute_text
	else
		mute_text = 'no'
	end
	if settings.mute_forward then
		mute_forward = settings.mute_forward
	else
		mute_forward = 'no'
	end
	if settings.mute_location then
		mute_location = settings.mute_location
	else
		mute_location = 'no'
	end
   if settings.mute_document then
		mute_document = settings.mute_document
	else
		mute_document = 'no'
	end
	if settings.mute_voice then
		mute_voice = settings.mute_voice
	else
		mute_voice = 'no'
	end
	if settings.mute_audio then
		mute_audio = settings.mute_audio
	else
		mute_audio = 'no'
	end
	if settings.mute_video then
		mute_video = settings.mute_video
	else
		mute_video = 'no'
	end
	if settings.mute_tgservice then
		mute_tgservice = settings.mute_tgservice
	else
		mute_tgservice = 'no'
	end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
		settings = data[tostring(chat)]['settings']
	else
		return
	end
	if settings.lock_link then
		lock_link = settings.lock_link
	else
		lock_link = 'no'
	end
	if settings.lock_tag then
		lock_tag = settings.lock_tag
	else
		lock_tag = 'no'
	end
	if settings.lock_arabic then
		lock_arabic = settings.lock_arabic
	else
		lock_arabic = 'no'
	end
	if settings.lock_mention then
		lock_mention = settings.lock_mention
	else
		lock_mention = 'no'
	end
		if settings.lock_edit then
		lock_edit = settings.lock_edit
	else
		lock_edit = 'no'
	end
		if settings.lock_spam then
		lock_spam = settings.lock_spam
	else
		lock_spam = 'no'
	end
	if settings.flood then
		lock_flood = settings.flood
	else
		lock_flood = 'no'
	end
	if settings.lock_markdown then
		lock_markdown = settings.lock_markdown
	else
		lock_markdown = 'no'
	end
	if settings.lock_webpage then
		lock_webpage = settings.lock_webpage
	else
		lock_webpage = 'no'
	end
  if msg.adduser or msg.joinuser or msg.deluser then
  if mute_tgservice == "yes" then
del_msg(msg.chat_id_, tonumber(msg.id_))
  end
end
if not is_mod(msg) then
if msg.content_.caption_ then
if lock_link == "yes" then
local is_link_caption = msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/")
if is_link_caption then
 if is_channel then
  --kick_user(user, chat)
  --tdcli.sendMessage(-1001078193822, "", 0, msg.from.print_name.." ("..msg.from.id..usname..")\nبه گروه پست لینکدار ارسال کرد.".."\n"..msg.content_.caption_, 0, "md")
  --tdcli.sendMessage(msg.chat_id_, "", 0, msg.from.print_name.." ("..msg.from.id..usname..")\nبه علت ارسال پست لینکدار از گروه اخراج شدید.", 0, "md")
  --tdcli.forwardMessages(-1001078193822, msg.chat_id_,{[0] = msg.id}, 0,dl_cb,nil)
  del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
       end
    end
 end
if lock_arabic == "yes" then
		local is_arabic_caption = msg.content_.caption_:match("[\216-\219][\128-\191]")
if is_arabic_caption then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
       end
    end
 end
if is_filter(msg, msg.content_.caption_) then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
      end
    end
if lock_tag == "yes" then
local tag_caption = msg.content_.caption_:match("@")
if tag_caption then
 if is_channel then
        --tdcli.sendMessage(-1001095849470, "", 0, msg.from.print_name.." ("..msg.from.id..usname..")\nبه گروه پست آی دی دار ارسال کرد.".."\n"..msg.content_.caption_, 0, "md")
        --tdcli.forwardMessages(-1001095849470, msg.chat_id_,{[0] = msg.id}, 0,dl_cb,nil)
        del_msg(msg.chat_id_, tonumber(msg.id_))
 elseif is_chat then
kick_user(user, chat)
      end
    end
  end
end
if msg.edited and lock_edit == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
    end
  end
if msg.forward_info_ and mute_forward == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
    end
  end
if msg.photo_ and mute_photo == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
    if msg.video_ and mute_video == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
    if msg.document_ and mute_document == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
    if msg.sticker_ and mute_sticker == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
    if msg.animation_ and mute_gif == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
    if msg.contact_ and mute_contact == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
    if msg.location_ and mute_location == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
    if msg.voice_ and mute_voice == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
    if tonumber(msg.via_bot_user_id_) ~= 0 and mute_inline == "yes" then
 if is_channel then
  --kick_user(user, chat)
  --tdcli.sendMessage(-1001078193822, "", 0, msg.from.print_name.." ("..msg.from.id..usname..")\nپست دکمه شیشه ای دار ارسال کرد.".."\n", 0, "md")
  --tdcli.forwardMessages(-1001078193822, msg.chat_id_,{[0] = msg.id}, 0,dl_cb,nil)
  del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
    if msg.game_ and mute_game == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
    if msg.audio_ and mute_audio == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.text then
local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
local _nl, real_digits = string.gsub(msg.text, '%d', '')
if lock_spam == "yes" and string.len(msg.text) > 2049 or ctrl_chars > 40 or real_digits > 2000 then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
local link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_msg
and lock_link == "yes" then
 if is_channel then
  --kick_user(user, chat)
  --tdcli.forwardMessages(-1001078193822, msg.chat_id_,{[0] = msg.id}, 0,dl_cb,nil)
  --tdcli.sendMessage(-1001078193822, "", 0, msg.from.print_name.." ("..msg.from.id..usname..")\nبه گروه پست لینکدار ارسال کرد.".."\n"..msg.text, 0, "md")
  --tdcli.sendMessage(msg.chat_id_, "", 0, msg.from.print_name.." ("..msg.from.id..usname..")\nبه علت ارسال پست لینکدار از گروه اخراج شدید.", 0, "md")
  del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
local tag_msg = msg.text:match("@")
if tag_msg and lock_tag == "yes" then
 if is_channel then
        --tdcli.forwardMessages(-1001095849470, msg.chat_id_,{[0] = msg.id}, 0,dl_cb,nil)
        --tdcli.sendMessage(-1001095849470, "", 0, msg.from.print_name.." ("..msg.from.id..usname..")\nبه گروه پست آی دی دار ارسال کرد.".."\n"..msg.text, 0, "md")
	del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
if is_filter(msg, msg.text) then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
      end
    end
local arabic_msg = msg.text:match("[\216-\219][\128-\191]")
if arabic_msg and lock_arabic == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.text:match("(.*)")
and mute_text == "yes" then
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
     end
   end
end
if mute_all == "yes" then 
 if is_channel then
 del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
   end
end
if msg.content_.entities_ and msg.content_.entities_[0] then
 if msg.content_.entities_[0].ID == "MessageEntityMentionName" then
  if lock_mention == "yes" then
    if is_channel then
        --tdcli.forwardMessages(-1001095849470, msg.chat_id_,{[0] = msg.id}, 0,dl_cb,nil)
        --tdcli.sendMessage(-1001095849470, "", 0, msg.from.print_name.." ("..msg.from.id..usname..")\nبه گروه پست آی دی دار ارسال کرد.".."\n"..msg.text, 0, "md")
        del_msg(msg.chat_id_, tonumber(msg.id_))
    elseif is_chat then
        kick_user(user, chat) 
    end 
   end
  end
  if msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
      if lock_webpage == "yes" then
if is_channel then
  --kick_user(user, chat)
  --tdcli.forwardMessages(-1001078193822, msg.chat_id_,{[0] = msg.id}, 0,dl_cb,nil)
  --tdcli.sendMessage(-1001078193822, "", 0, msg.from.print_name.." ("..msg.from.id..usname..")\nبه گروه پست لینکدار ارسال کرد.".."\n"..msg.text, 0, "md")
  del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
             end
          end
      end 
  if msg.content_.entities_[0].ID == "MessageEntityBold" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic" then
      if lock_markdown == "yes" then
if is_channel then
  --kick_user(user, chat)
  --tdcli.forwardMessages(-1001078193822, msg.chat_id_,{[0] = msg.id}, 0,dl_cb,nil)
  --tdcli.sendMessage(-1001078193822, "", 0, msg.from.print_name.." ("..msg.from.id..usname..")\nبه گروه پست با متن خاص ارسال کرد.".."\n"..msg.text, 0, "md")
  del_msg(msg.chat_id_, tonumber(msg.id_))
  elseif is_chat then
kick_user(user, chat)
             end
          end
      end
 end
if gp_type(chat) ~= 'pv' then
  if lock_flood == "yes" then
    local hash = 'user:'..user..':msgs'
    local msgs = tonumber(redis:get(hash) or 0)
        local NUM_MSG_MAX = 5
        if data[tostring(chat)] then
          if data[tostring(chat)]['settings']['num_msg_max'] then
            NUM_MSG_MAX = tonumber(data[tostring(chat)]['settings']['num_msg_max'])
          end
        end
    if msgs > NUM_MSG_MAX then
  if is_mod(msg) then
    return
  end
  if msg.adduser then
    return
  end
if redis:get('sender:'..user..':flood') then
return
else
    del_msg(msg.chat_id_, msg.id_)
    kick_user(user, chat)
    tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "کاربر "..user.." به علت ارسال پست رگباری از گروه اخراج شد", 0, "md")
redis:setex('sender:'..user..':flood', 30, true)
      end
    end
    redis:setex(hash, TIME_CHECK, msgs+1)
               end
           end
      end
   end
end
return {
	patterns = {},
	pre_process = pre_process
}
