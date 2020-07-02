# Politikus API Documentation

- [**【GET】** Paginated Persons](#get-paginated-persons)
- [**【GET】** Person by ID](#get-person-by-id)

## Model

### Person

Here's the simplified data model for `Person`.
The full data model will be listed at "**GET** Person by ID".

```json
{
  "id": "azmin-ali",
  "name": "Azmin Ali",
  "summary": "Mohamed Azmin bin Ali is a Malaysian politician, who currently serves as a Senior Minister and the Minister of International Trade and Industry.",
  "items": [
    {
      "@id": "https://politikus.sinarproject.org/persons/azmin-ali/father-of-farah-afifah-azmin",
      "@type": "Relationship",
      "description": "Azmin Ali is the father of Farah Afifah Azmin (Farah Afifah)",
      "review_state": "published",
      "title": "Father of Farah Afifah Azmin"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/azmin-ali/father-of-farah-amira-azmin",
      "@type": "Relationship",
      "description": "Azmin Ali is the father of Farah Amira Azmin (Farah Amira)",
      "review_state": "published",
      "title": "Father of Farah Amira Azmin"
    }
  ],
  "items_total": 2,
  "image": {
    "content-type": "image/jpeg",
    "download": "https://politikus.sinarproject.org/persons/azmin-ali/@@images/bf57543b-e2c0-4a67-9739-265f1dafd877.jpeg",
    "filename": "dato-seri-mohamed-azmin-bin-ali-profile.jpg"
  },
  "is_folderish": true,
  "layout": "person-view",
  "notes": null,
  "rights": null,
  "subjects": [],
  "language": {
    "title": "English (United Kingdom)",
    "token": "en-gb"
  },
  "review_state": "published",
  "modified": "2020-05-23T15:47:14+00:00"
}
```
---

## API

- [x] Person

For the API to return in `json` format, you'll need to specify the header.
| Header | Value |
| :--- | :--- |
Accept | application/json

## Person

### [GET] Paginated Persons
```
https://politikus.sinarproject.org/persons?b_start={offset_position}
```

It will return 25 `Person` per request, therefore you will need to use the `offset_position` to set where you want to start your query position.

Example below is showing how you will load the next 25 `Person`, starting from 26th `Person`.

| Code | 200 👍 |
| :--- | :--- |

| Path Parameters | Value |
| :--- | :--- |
| offset_position | 26 |

```json
{
  "@components": {
    "actions": {
      "@id": "https://politikus.sinarproject.org/persons/@actions"
    },
    "breadcrumbs": {
      "@id": "https://politikus.sinarproject.org/persons/@breadcrumbs"
    },
    "navigation": {
      "@id": "https://politikus.sinarproject.org/persons/@navigation"
    },
    "types": {
      "@id": "https://politikus.sinarproject.org/persons/@types"
    },
    "workflow": {
      "@id": "https://politikus.sinarproject.org/persons/@workflow"
    }
  },
  "@id": "https://politikus.sinarproject.org/persons",
  "@type": "Folder",
  "UID": "c8c11f3e70c84dbf81eb87ded1249281",
  "allow_discussion": false,
  "batching": {
    "@id": "https://politikus.sinarproject.org/persons?b_start=26",
    "first": "https://politikus.sinarproject.org/persons?b_start=0",
    "last": "https://politikus.sinarproject.org/persons?b_start=200",
    "next": "https://politikus.sinarproject.org/persons?b_start=51",
    "prev": "https://politikus.sinarproject.org/persons?b_start=1"
  },
  "contributors": [],
  "created": "2020-03-20T18:24:18+00:00",
  "creators": [
    "kaeru"
  ],
  "description": "Persons of Interest",
  "effective": "2020-04-06T09:44:54",
  "exclude_from_nav": false,
  "expires": null,
  "id": "persons",
  "is_folderish": true,
  "items": [
    {
      "@id": "https://politikus.sinarproject.org/persons/azizah-mohd-dun",
      "@type": "Person",
      "description": "Dato' Hajjah Azizah binti Mohd Dun is a Malaysian politician. She is the Member of the Parliament of Malaysia for the Beaufort constituency in Sabah.",
      "review_state": "published",
      "title": "Azizah Mohd Dun"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/azlan-hashim",
      "@type": "Person",
      "description": "Corporate figure who sits on a board of several GLCs",
      "review_state": "published",
      "title": "Azlan Hashim"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/azman-ibrahim",
      "@type": "Person",
      "description": "Azman Ibrahim is a Malaysian politician and State Representative of Terengganu from Malaysian Islamic Party (PAS)",
      "review_state": "published",
      "title": "Azman Ibrahim"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/azmin-ali",
      "@type": "Person",
      "description": "Mohamed Azmin bin Ali is a Malaysian politician, who currently serves as a Senior Minister and the Minister of International Trade and Industry.",
      "review_state": "published",
      "title": "Azmin Ali"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/chan-tien-ghee",
      "@type": "Person",
      "description": "Datuk Chan Tien Ghee is the  Managing director Central Malaysia Properties Sdn Bhd (CMP)",
      "review_state": "published",
      "title": "Chan Tien Ghee"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/charles-santiago",
      "@type": "Person",
      "description": "Charles Santiago is a Malaysian politician from Democratic Action Party (DAP) and Member of Parliament for Klang",
      "review_state": "published",
      "title": "Charles Santiago"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/che-abdullah-mat-nawi",
      "@type": "Person",
      "description": "Che Abdullah Mat Nawi is a Malaysian politician  from PAS and Member of Parliment for Tumpat",
      "review_state": "published",
      "title": "Che Abdullah Mat Nawi"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/che-zakaria-mohd-salleh",
      "@type": "Person",
      "description": "Dato' Che Zakaria Mohd. Salleh is a Malaysian politician and State Legislator for Permas, Johor from BERSATU political party",
      "review_state": "published",
      "title": "Che Zakaria Mohd. Salleh"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/chong-sin-woon",
      "@type": "Person",
      "description": "Datuk Chong Sin Woon is a Malaysian politician from the Malaysian Chinese Association. Chong is the present secretary-general of MCA and Charperson of Port Klang Authority (PKA)",
      "review_state": "published",
      "title": "Chong Sin Woon"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/chua-tian-chang",
      "@type": "Person",
      "description": "Chua Tian Chang, better known as Tian Chua, is a Malaysian politician.",
      "review_state": "published",
      "title": "Chua Tian Chang"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/daniyar-kessibayev",
      "@type": "Person",
      "description": "Daniyar Kessibayev is Kazakhstan national and  husband to Nooryana Najwa Najib daughter of Najib Razak. He is stepson of Kazakh millionaire Bolat Nazarbayez who is the brother of strongman Nursultan Nazarbayev",
      "review_state": "published",
      "title": "Daniyar Kessibayev"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/eddin-syazlee-shith",
      "@type": "Person",
      "description": "Dato’ Eddin Syazlee bin Shith is a Malaysian politician,  Member of Parliament for seat of Kuala Pilah, Negeri Sembilan and currently serving as Deputy Minister in the Prime Minister's Department (Law and Parliamentary Affairs).",
      "review_state": "published",
      "title": "Eddin Syazlee Shith"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/edmund-santhara-kumar-ramanaidu",
      "@type": "Person",
      "description": "Dato' Sri Dr. Edmund Santhara @ Santhara Kumar s/o Ramanaidu is a Malaysian businessman, entrepreneur and politician.",
      "review_state": "published",
      "title": "Edmund Santhara Kumar Ramanaidu"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/fadillah-yusof",
      "@type": "Person",
      "description": "Dato' Sri Fadillah bin Yusof is a Malaysian politician from the United Traditional Bumiputera Party currently serving as three-term Member of Parliament of Malaysia for the Petra Jaya constituency in the state of Sarawak. He currently serving as the Works Minister of Malaysia since 10 March 2020 for the second time.",
      "review_state": "published",
      "title": "Fadillah Yusof"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/fakhri-yassin",
      "@type": "Person",
      "description": "Fakhri Yassin is the son of Malaysian politician Muhyiddin Yasin",
      "review_state": "published",
      "title": "Fakhri Yassin"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/farah-afifah-azmin",
      "@type": "Person",
      "description": "Farah Afifah Azmin (Farah Afifah) is the daughter of politician Azmin Ali",
      "review_state": "published",
      "title": "Farah Afifah Azmin"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/farah-amira-azmin",
      "@type": "Person",
      "description": "Farah Amira Azmin (Farah Amira) is the daughter of politician Azmin Ali",
      "review_state": "published",
      "title": "Farah Amira Azmin"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/farhan-yassin",
      "@type": "Person",
      "description": "Farhan Yassin is the son of Malaysian politician Muhyiddin Yasin",
      "review_state": "published",
      "title": "Farhan Yassin"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/fauziah-ag-piut",
      "@type": "Person",
      "description": "Wife of ex-Sabah Water Department head AG Mohd Tahir. Charged with money laundering.",
      "review_state": "published",
      "title": "Fauziah Ag Piut"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/goh-ching-yin",
      "@type": "Person",
      "description": "Goh Ching Yin is a Malaysian banker, and currently Director, Chairman of Executive Committee (EXCO) and Nomination & Remuneration Committee (NRC) at Khazanah Nasional Berhad",
      "review_state": "published",
      "title": "Goh Ching Yin"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/halimah-mohamed-sadique",
      "@type": "Person",
      "description": "Datuk Wira Halimah binti Mohamed Sadique is a Malaysian politician and was the Member of Parliament of Malaysia for the Tenggara constituency in the state of Johor.",
      "review_state": "published",
      "title": "Halimah Mohamed Sadique"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/hamzah-zainudin",
      "@type": "Person",
      "description": "Dato' Seri Hamzah bin Zainudin is a Malaysian politician and is the Member of Parliament of Malaysia for the Larut constituency in Perak. Presently he is a member of the Malaysian United Indigenous Party or Parti Pribumi Bersatu Malaysia, a component of Perikatan Nasional coalition.",
      "review_state": "published",
      "title": "Hamzah Zainudin"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/hanifah-hajar-taib",
      "@type": "Person",
      "description": "Dato’ Hanifah Hajar Taib also known as Hanifah Hajar Taib-Alsree is a Malaysian politician and businesswoman. She is the current Member of Parliament of Malaysia for the Mukah constituency in Sarawak",
      "review_state": "published",
      "title": "Hanifah Hajar Taib"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/hasbi-habibollah",
      "@type": "Person",
      "description": "Haji Hasbi bin Habibollah (Jawi: حسبي بن حبيب الله; born 2 January 1963) is a Malaysian politician, and currently serving as Deputy Minister of Transport since 10 March 2020. He is the Member of Parliamen (MP) for the Limbang constituency in Sarawak",
      "review_state": "published",
      "title": "Hasbi Habibollah"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/hasbullah-osman",
      "@type": "Person",
      "description": "Hasbullah Osman is a Malaysian politician, Member of Parliament for Gerik from UMNO.",
      "review_state": "published",
      "title": "Hasbullah Osman"
    }
  ],
  "items_total": 201,
  "language": {
    "title": "English (United Kingdom)",
    "token": "en-gb"
  },
  "layout": "listing_view",
  "modified": "2020-06-29T02:43:58+00:00",
  "nextPreviousEnabled": false,
  "parent": {
    "@id": "https://politikus.sinarproject.org",
    "@type": "Plone Site",
    "description": "",
    "title": "Politikus"
  },
  "relatedItems": [],
  "review_state": "published",
  "rights": null,
  "subjects": [],
  "title": "Persons",
  "version": "current"
}
```

---

### [GET] Person by ID
```
https://politikus.sinarproject.org/{id}
```
| Code | 200 👍 |
| :--- | :--- |

| Path Parameters | Value |
| :--- | :--- |
| id | azmin-ali |


**Response**
```json
{
  "@components": {
    "actions": {
      "@id": "https://politikus.sinarproject.org/persons/azmin-ali/@actions"
    },
    "breadcrumbs": {
      "@id": "https://politikus.sinarproject.org/persons/azmin-ali/@breadcrumbs"
    },
    "navigation": {
      "@id": "https://politikus.sinarproject.org/persons/azmin-ali/@navigation"
    },
    "types": {
      "@id": "https://politikus.sinarproject.org/persons/azmin-ali/@types"
    },
    "workflow": {
      "@id": "https://politikus.sinarproject.org/persons/azmin-ali/@workflow"
    }
  },
  "@id": "https://politikus.sinarproject.org/persons/azmin-ali",
  "@type": "Person",
  "UID": "41f21049904a451d8b42428e8d44334a",
  "allow_discussion": false,
  "biography": null,
  "birth_date": null,
  "contributors": [],
  "created": "2020-03-21T13:39:57+00:00",
  "creators": [
    "kaeru"
  ],
  "death_date": null,
  "effective": "2020-04-06T09:45:11",
  "exclude_from_nav": false,
  "expires": null,
  "gender": {
    "title": "Male",
    "token": "male"
  },
  "id": "azmin-ali",
  "image": {
    "content-type": "image/jpeg",
    "download": "https://politikus.sinarproject.org/persons/azmin-ali/@@images/bf57543b-e2c0-4a67-9739-265f1dafd877.jpeg",
    "filename": "dato-seri-mohamed-azmin-bin-ali-profile.jpg",
    "height": 420,
    "scales": {
      "icon": {
        "download": "https://politikus.sinarproject.org/persons/azmin-ali/@@images/e3d1ff70-e0d5-434a-abfe-a5e3b2eb5af3.jpeg",
        "height": 32,
        "width": 25
      },
      "large": {
        "download": "https://politikus.sinarproject.org/persons/azmin-ali/@@images/d8fe3fc7-536c-498e-9db3-b5aa0afabdbf.jpeg",
        "height": 420,
        "width": 336
      },
      "listing": {
        "download": "https://politikus.sinarproject.org/persons/azmin-ali/@@images/10c31055-091e-411c-b8a9-50c49a2f64eb.jpeg",
        "height": 16,
        "width": 12
      },
      "mini": {
        "download": "https://politikus.sinarproject.org/persons/azmin-ali/@@images/e49d3dac-87f5-49ca-be61-9c593893b3ec.jpeg",
        "height": 200,
        "width": 160
      },
      "preview": {
        "download": "https://politikus.sinarproject.org/persons/azmin-ali/@@images/f49d2d1c-b86c-425c-aa2a-34c76d0fca22.jpeg",
        "height": 400,
        "width": 320
      },
      "thumb": {
        "download": "https://politikus.sinarproject.org/persons/azmin-ali/@@images/b90f7cc8-fac3-4c91-9161-670bd3b9b2c5.jpeg",
        "height": 128,
        "width": 102
      },
      "tile": {
        "download": "https://politikus.sinarproject.org/persons/azmin-ali/@@images/3752275b-8ea9-4c31-91ab-154eaded3c54.jpeg",
        "height": 64,
        "width": 51
      }
    },
    "size": 83303,
    "width": 336
  },
  "is_folderish": true,
  "items": [
    {
      "@id": "https://politikus.sinarproject.org/persons/azmin-ali/father-of-farah-afifah-azmin",
      "@type": "Relationship",
      "description": "Azmin Ali is the father of Farah Afifah Azmin (Farah Afifah)",
      "review_state": "published",
      "title": "Father of Farah Afifah Azmin"
    },
    {
      "@id": "https://politikus.sinarproject.org/persons/azmin-ali/father-of-farah-amira-azmin",
      "@type": "Relationship",
      "description": "Azmin Ali is the father of Farah Amira Azmin (Farah Amira)",
      "review_state": "published",
      "title": "Father of Farah Amira Azmin"
    }
  ],
  "items_total": 2,
  "language": {
    "title": "English (United Kingdom)",
    "token": "en-gb"
  },
  "layout": "person-view",
  "modified": "2020-05-23T15:47:14+00:00",
  "name": "Azmin Ali",
  "notes": null,
  "parent": {
    "@id": "https://politikus.sinarproject.org/persons",
    "@type": "Folder",
    "description": "Persons of Interest",
    "review_state": "published",
    "title": "Persons"
  },
  "review_state": "published",
  "rights": null,
  "subjects": [],
  "summary": "Mohamed Azmin bin Ali is a Malaysian politician, who currently serves as a Senior Minister and the Minister of International Trade and Industry.",
  "version": "current"
}
```