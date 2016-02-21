# User Story

- 身為使用者，必須註冊才能使用本網站。

- 身為使用者，可以在本網站新增電影。
	- 身為使用者，可以在本網站新增電影類型、名稱、介紹、導演、片長、圖片。
		- 身為使用者，可以在電影介紹貼上youtube網址嵌入影片以及使用markdown。
	- 身為使用者，可以在本網站編輯電影類型、名稱、介紹、導演、片長、圖片。

- 身為使用者，可以在電影頁面中留言發表評論
	- 身為使用者，再發表評論時，可以評分。
- 身為使用者，也可以在電影評論頁面選擇自己喜好(Like)。
- 身為使用者，可以對自己發表的評論進行編輯。
- 身為使用者，可以對所有評論選擇Like or Dislike

- 電影頁面中，會出現所有留言的平均分數。
- 首頁可以選擇電影類型，並出現該類型的所有電影。


## Model

- Category
	has_many :movies
	- Type: string

- Movie
	belongs_to :category
	- Title: string
	- Description: text
	- Director: string
	- Length: integer
	- Image: string
	- Category_id: integer

- User
	has_many :comments

- Comment
	belongs_to :user
	- rating: integer
	- Comment: text
	- User_id: integer
	