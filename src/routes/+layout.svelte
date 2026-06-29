<script lang="ts">
  import './layout.css';
  import favicon from '$lib/assets/favicon.svg';
  import { onMount } from 'svelte';
  import { resolve } from '$app/paths';

  let { children } = $props();

  const active = 'text-sm px-3 py-1.5 rounded-md bg-neutral-100 text-neutral-900 font-medium';
  const inactive = 'text-sm px-3 py-1.5 rounded-md text-neutral-500 hover:text-neutral-900 hover:bg-neutral-50 transition-colors';

  let activeHash = $state('#about');

  const links = [
    { href: '/#about', hash: '#about', label: 'About' },
    { href: '/#projects', hash: '#projects', label: 'Projects' },
    { href: '/#education', hash: '#education', label: 'Education' },
  ] as const;

  onMount(() => {
    const sections = Array.from(document.querySelectorAll('section[id]'));
    const lastSection = sections[sections.length - 1];

    const observer = new IntersectionObserver(
      (entries) => entries.forEach(e => { if (e.isIntersecting) activeHash = `#${e.target.id}`; }),
      { rootMargin: '0px 0px -80% 0px', threshold: 0 }
    );

    sections.forEach(el => observer.observe(el));

    const onScroll = () => {
      const nearBottom = window.scrollY + window.innerHeight >= document.documentElement.scrollHeight - 10;
      if (nearBottom) activeHash = `#${lastSection.id}`;
    };

    window.addEventListener('scroll', onScroll, { passive: true });

    return () => {
      observer.disconnect();
      window.removeEventListener('scroll', onScroll);
    };
  });
</script>

<svelte:head>
  <link rel="icon" href={favicon} />
  <title>Beto Sardinha</title>
  <meta name="description" content="Personal website" />
</svelte:head>

<div class="flex min-h-screen">
  <nav class="w-56 shrink-0 border-r border-neutral-200 px-6 py-10 flex flex-col gap-1 sticky top-0 h-screen">
    <span class="text-sm font-semibold text-neutral-900 mb-6">Beto Sardinha</span>
    {#each links as link (link.hash)}
      <a
        href={resolve(link.href)}
        onclick={() => activeHash = link.hash}
        class={activeHash === link.hash ? active : inactive}
      >
        {link.label}
      </a>
    {/each}
  </nav>

  <main class="flex-1 px-12 py-10 max-w-3xl">
    {@render children()}
  </main>
</div>
